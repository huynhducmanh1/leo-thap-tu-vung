#!/usr/bin/env node

// Install: npm install openai dotenv glob ignore chalk
// This version works with Bedrock Proxy using OpenAI API format

import OpenAI from 'openai';
import { glob } from 'glob';
import fs from 'fs/promises';
import path from 'path';
import chalk from 'chalk';
import ignore from 'ignore';
import dotenv from 'dotenv';
import crypto from 'crypto';

dotenv.config();

// Initialize OpenAI client with your Bedrock proxy
const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY,
  baseURL: process.env.OPENAI_BASE_URL,
});

const CACHE_FILE = '.claude-cache.json';
const MAX_FILE_SIZE = 100000; // Back to 100KB since we're only scanning lib/

// Default ignore patterns for Flutter
const DEFAULT_IGNORE = [
  'node_modules/**',
  '.git/**',
  '.dart_tool/**',
  'build/**',
  '.flutter-plugins',
  '.flutter-plugins-dependencies',
  '.packages',
  'ios/Pods/**',
  'ios/.symlinks/**',
  'android/.gradle/**',
  'android/app/build/**',
  'android/captures/**',
  'linux/flutter/ephemeral/**',
  'macos/Flutter/ephemeral/**',
  'windows/flutter/ephemeral/**',
  '*.g.dart',
  '*.freezed.dart',
  '*.mocks.dart',
  'assets/**/*.png',
  'assets/**/*.jpg',
  'assets/**/*.ttf',
  'assets/**/*.otf',
  '*.log',
  '.env*',
  '*.lock',
  'pubspec.lock',
  '.DS_Store',
  '*.backup'
];

// Scan project files (Flutter: only lib/ and pubspec.yaml)
async function scanProject(rootDir = '.') {
  console.log(chalk.blue('🔍 Scanning Flutter project (lib/ folder only)...'));

  const ig = ignore();
  ig.add(DEFAULT_IGNORE);

  try {
    const gitignore = await fs.readFile('.gitignore', 'utf-8');
    ig.add(gitignore);
  } catch (e) {
    // No .gitignore
  }

  // Only scan lib/ folder and key config files
  const patterns = [
    'lib/**/*',           // All Dart files in lib/
    'pubspec.yaml',       // Dependencies and config
    'analysis_options.yaml', // Linting rules
    'README.md'           // Documentation
  ];

  const allFiles = [];
  for (const pattern of patterns) {
    const found = await glob(pattern, {
      cwd: rootDir,
      nodir: true,
      dot: false
    });
    allFiles.push(...found);
  }

  const files = [];
  let totalSize = 0;

  for (const file of allFiles) {
    if (ig.ignores(file)) continue;

    try {
      const fullPath = path.join(rootDir, file);
      const stats = await fs.stat(fullPath);

      if (stats.size > MAX_FILE_SIZE) {
        console.log(chalk.gray(`  Skipping large file: ${file}`));
        continue;
      }

      const content = await fs.readFile(fullPath, 'utf-8');
      const hash = crypto.createHash('md5').update(content).digest('hex');

      files.push({
        path: file,
        content,
        size: stats.size,
        hash,
        modified: stats.mtime.toISOString()
      });

      totalSize += stats.size;
    } catch (e) {
      console.log(chalk.gray(`  Skipping: ${file}`));
    }
  }

  console.log(chalk.green(`✓ Scanned ${files.length} files (${(totalSize / 1024).toFixed(2)} KB)`));

  return files;
}

// Load or create cache
async function loadCache() {
  try {
    const data = await fs.readFile(CACHE_FILE, 'utf-8');
    return JSON.parse(data);
  } catch (e) {
    return { files: [], lastScan: null };
  }
}

// Save cache
async function saveCache(cache) {
  await fs.writeFile(CACHE_FILE, JSON.stringify(cache, null, 2));
}

// Check if project changed
async function hasProjectChanged(cache) {
  if (!cache.lastScan) return true;

  const currentFiles = await scanProject();

  if (currentFiles.length !== cache.files.length) return true;

  for (const file of currentFiles) {
    const cached = cache.files.find(f => f.path === file.path);
    if (!cached || cached.hash !== file.hash) {
      return true;
    }
  }

  return false;
}

// Analyze large projects with summary
async function analyzeProjectSummary(files, instruction) {
  console.log(chalk.cyan('Creating intelligent project summary...\n'));

  // Build a compact summary
  let summary = "# Project Overview\n\n";

  // File structure
  const dartFiles = files.filter(f => f.path.endsWith('.dart'));
  const byDir = {};
  dartFiles.forEach(f => {
    const dir = path.dirname(f.path);
    if (!byDir[dir]) byDir[dir] = [];
    byDir[dir].push(path.basename(f.path));
  });

  summary += "## Structure\n";
  Object.keys(byDir).sort().forEach(dir => {
    summary += `- ${dir}/ (${byDir[dir].length} files)\n`;
  });

  // Key files (main, configs, etc)
  summary += "\n## Key Files\n\n";
  const keyFiles = ['pubspec.yaml', 'lib/main.dart', 'README.md', 'lib/app.dart'];
  for (const key of keyFiles) {
    const file = files.find(f => f.path === key || f.path.endsWith(key));
    if (file) {
      const ext = path.extname(file.path).slice(1) || 'txt';
      summary += `### ${file.path}\n\`\`\`${ext}\n${file.content.substring(0, 2000)}\n...\n\`\`\`\n\n`;
    }
  }

  // Sample of other important files
  summary += "## Sample Files (for context)\n\n";
  const sampleFiles = dartFiles.slice(0, 10);
  for (const file of sampleFiles) {
    summary += `### ${file.path}\n\`\`\`dart\n${file.content.substring(0, 1000)}\n...\n\`\`\`\n\n`;
  }

  summary += `\n## Statistics\n`;
  summary += `- Total Dart files: ${dartFiles.length}\n`;
  summary += `- Total lines of code: ~${dartFiles.reduce((sum, f) => sum + f.content.split('\n').length, 0)}\n`;

  const systemPrompt = `You are an expert Flutter developer analyzing a Vietnamese-English vocabulary learning app with SRS and gamification.

Based on the project summary provided, give architectural recommendations, identify issues, and suggest improvements.

Focus on:
- Code organization and architecture
- SRS implementation quality
- Gamification effectiveness
- Flutter best practices
- Performance optimizations
- User experience for Vietnamese learners`;

  const userPrompt = `${summary}\n\n---\n\nUser Request: ${instruction}\n\nPlease provide high-level recommendations based on this project summary.`;

  console.log(chalk.cyan('🤖 Claude is analyzing the summary...\n'));

  const response = await callClaude(userPrompt, systemPrompt, false);

  console.log(chalk.green('\n📋 Analysis Results:\n'));
  console.log(response);
  console.log(chalk.gray('\n---\n'));
  console.log(chalk.yellow('💡 For specific file modifications, use targeted commands like:'));
  console.log(chalk.gray('   node claude-project.js "improve lib/screens/home_screen.dart"\n'));
}

// Build project context
function buildProjectContext(files) {
  let context = "# Project Structure\n\n";

  const byDir = {};
  files.forEach(f => {
    const dir = path.dirname(f.path);
    if (!byDir[dir]) byDir[dir] = [];
    byDir[dir].push(path.basename(f.path));
  });

  context += "## Directory Tree\n```\n";
  Object.keys(byDir).sort().forEach(dir => {
    context += `${dir}/\n`;
    byDir[dir].forEach(file => {
      context += `  - ${file}\n`;
    });
  });
  context += "```\n\n";

  context += "## File Contents\n\n";
  files.forEach(file => {
    const ext = path.extname(file.path).slice(1) || 'txt';
    context += `### ${file.path}\n\`\`\`${ext}\n${file.content}\n\`\`\`\n\n`;
  });

  return context;
}

// Parse modifications from Claude's response
function parseModifications(response) {
  const modifications = [];

  // Format 1: ### FILE: path
  const fileRegex = /###\s*(?:FILE|MODIFY|UPDATE):\s*([^\n]+)\n```[\w]*\n([\s\S]*?)```/gi;
  let match;

  while ((match = fileRegex.exec(response)) !== null) {
    modifications.push({
      path: match[1].trim(),
      content: match[2].trim()
    });
  }

  // Format 2: [FILE: path]
  const altRegex = /\[FILE:\s*([^\]]+)\]\n```[\w]*\n([\s\S]*?)```/gi;
  while ((match = altRegex.exec(response)) !== null) {
    modifications.push({
      path: match[1].trim(),
      content: match[2].trim()
    });
  }

  return modifications;
}

// Call Claude via OpenAI-compatible API
async function callClaude(prompt, systemPrompt, stream = false) {
  try {
    // Debug: Log the request
    console.log(chalk.gray('API Base URL:'), process.env.OPENAI_BASE_URL);
    console.log(chalk.gray('API Key (first 10 chars):'), process.env.OPENAI_API_KEY?.substring(0, 10) + '...');

    // Use model from .env or default
    const model = process.env.CLAUDE_MODEL || 'apac.anthropic.claude-sonnet-4-20250514-v1:0';

    // Combine system and user messages (some proxies don't support system role)
    const combinedPrompt = `${systemPrompt}\n\n---\n\n${prompt}`;

    const requestBody = {
      model: model,
      messages: [
        { role: 'user', content: combinedPrompt }
      ],
      max_tokens: 8000,
      temperature: 0.7,
      stream: stream
    };

    console.log(chalk.gray('Sending request with model:'), requestBody.model);

    const response = await openai.chat.completions.create(requestBody);

    if (stream) {
      let fullResponse = '';
      for await (const chunk of response) {
        const content = chunk.choices[0]?.delta?.content || '';
        fullResponse += content;
        process.stdout.write(chalk.gray(content));
      }
      return fullResponse;
    } else {
      return response.choices[0].message.content;
    }
  } catch (error) {
    console.error(chalk.red('\n❌ Error calling Claude:'));
    console.error(chalk.red('Status:'), error.status);
    console.error(chalk.red('Message:'), error.message);

    if (error.response) {
      console.error(chalk.red('Response:'), error.response);
    }

    console.log(chalk.yellow('\n💡 Troubleshooting:'));
    console.log(chalk.yellow('1. Check if your API key is correct in .env'));
    console.log(chalk.yellow('2. Verify the base URL is accessible'));
    console.log(chalk.yellow('3. The proxy might expect a different model name'));
    console.log(chalk.yellow('4. Try adding more details to .env (see below)\n'));

    throw error;
  }
}

// Main edit function
async function editProject(instruction, options = {}) {
  console.log(chalk.blue('\n🚀 Claude Project Editor\n'));

  let cache = await loadCache();
  let files;

  if (options.forceScan || await hasProjectChanged(cache)) {
    console.log(chalk.yellow('📁 Project changed or first run - scanning...'));
    files = await scanProject();
    cache = {
      files,
      lastScan: new Date().toISOString()
    };
    await saveCache(cache);
  } else {
    console.log(chalk.green('✓ Using cached project scan'));
    files = cache.files;
  }

  const projectContext = buildProjectContext(files);
  const estimatedTokens = Math.ceil(projectContext.length / 4);
  console.log(chalk.gray(`📊 Project size: ~${estimatedTokens.toLocaleString()} tokens\n`));

  // More lenient limits since we're only scanning lib/
  if (estimatedTokens > 150000) {
    console.log(chalk.red('⚠️  Project is still too large!'));
    console.log(chalk.yellow('💡 Try being more specific: "analyze lib/screens/" or "improve lib/services/"\n'));
    return;
  }

  if (estimatedTokens > 100000) {
    console.log(chalk.yellow('⚠️  Large project - Claude may take longer to respond\n'));
  }

  const systemPrompt = `You are an expert full-stack developer with access to the entire project codebase.

PROJECT CONTEXT:
This is a gamified, SRS-based (Spaced Repetition System) mobile and web application that helps Vietnamese learners effectively memorize and retain English vocabulary for the long term. The app is built with Flutter for cross-platform support.

Key features to consider:
- Spaced Repetition System (SRS) algorithm for optimal learning
- Gamification elements (points, levels, streaks, achievements)
- Vietnamese-English vocabulary learning
- Long-term retention focus
- Mobile-first design with web support
- User progress tracking and analytics

When making changes:

1. Analyze the entire project structure first
2. Identify ALL files that need to be modified
3. Make changes that are consistent across the codebase
4. Consider dependencies and imports
5. Keep the learning experience engaging and effective
6. Ensure changes align with SRS principles and gamification best practices
7. Consider Vietnamese learner UX and localization

To modify files, use this format:

### FILE: path/to/file.dart
\`\`\`dart
// Complete new file content here
\`\`\`

### FILE: path/to/another.dart
\`\`\`dart
// Complete new file content
\`\`\`

IMPORTANT:
- Return COMPLETE file contents, not just diffs
- Modify ALL related files (if you change an import, update the export too)
- Maintain code style consistency across files
- Consider SRS algorithm integrity when modifying learning logic
- Ensure gamification elements are motivating but not overwhelming
- Explain your changes briefly before showing the code`;

  const userPrompt = `${projectContext}

---

User Request: ${instruction}

Please analyze the entire project and modify all necessary files to fulfill this request. Return the complete updated content for each file that needs to be changed.`;

  console.log(chalk.cyan('🤖 Claude is analyzing your project...\n'));

  const response = await callClaude(userPrompt, systemPrompt, options.stream);

  if (options.stream) {
    console.log('\n');
  }

  const modifications = parseModifications(response);

  if (modifications.length === 0) {
    console.log(chalk.yellow('\n⚠️  No file modifications detected in response'));
    console.log(chalk.gray('Response from Claude:\n'));
    console.log(response);
    console.log(chalk.gray('\nClaude may have only provided explanation. Try being more specific.\n'));
    return;
  }

  console.log(chalk.green(`\n✓ Found ${modifications.length} file(s) to modify:\n`));
  modifications.forEach(mod => {
    console.log(chalk.cyan(`  📝 ${mod.path}`));
  });

  if (options.preview) {
    console.log(chalk.yellow('\n👀 Preview mode - no files were modified'));
    console.log(chalk.gray('Run without --preview to apply changes\n'));
    return;
  }

  console.log(chalk.blue('\n📝 Applying changes...\n'));

  for (const mod of modifications) {
    try {
      const backupPath = `${mod.path}.backup`;
      try {
        const original = await fs.readFile(mod.path, 'utf-8');
        await fs.writeFile(backupPath, original);
      } catch (e) {
        // File might not exist (new file)
      }

      await fs.mkdir(path.dirname(mod.path), { recursive: true });
      await fs.writeFile(mod.path, mod.content);
      console.log(chalk.green(`  ✓ Updated: ${mod.path}`));
    } catch (error) {
      console.error(chalk.red(`  ✗ Failed: ${mod.path} - ${error.message}`));
    }
  }

  cache.lastScan = null;
  await saveCache(cache);

  console.log(chalk.green('\n✅ Project updated successfully!\n'));
  console.log(chalk.gray('Backups created with .backup extension\n'));
}

// CLI
const args = process.argv.slice(2);
const instruction = args.filter(arg => !arg.startsWith('--')).join(' ');
const options = {
  preview: args.includes('--preview'),
  forceScan: args.includes('--force-scan'),
  stream: args.includes('--stream'),
  scanAll: args.includes('--all') // Scan entire project if needed
};

if (!instruction) {
  console.log(chalk.yellow('Usage: node claude-project.js "your instruction" [options]'));
  console.log(chalk.gray('\nOptions:'));
  console.log(chalk.gray('  --preview     Preview changes without applying'));
  console.log(chalk.gray('  --force-scan  Force rescan (ignore cache)'));
  console.log(chalk.gray('  --stream      Show real-time streaming output'));
  console.log(chalk.gray('  --all         Scan entire project (not just lib/)'));
  console.log(chalk.gray('\nExamples:'));
  console.log(chalk.gray('  node claude-project.js "add dark mode support"'));
  console.log(chalk.gray('  node claude-project.js "refactor to use Riverpod" --preview'));
  console.log(chalk.gray('  node claude-project.js "analyze entire codebase" --all\n'));
  process.exit(1);
}

editProject(instruction, options);