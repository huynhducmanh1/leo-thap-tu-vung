#!/usr/bin/env node

// Test script to debug API connection
// Usage: node test-api.js

import OpenAI from 'openai';
import dotenv from 'dotenv';
import chalk from 'chalk';

dotenv.config();

console.log(chalk.blue('🔍 Testing API Connection...\n'));

// Check environment variables
console.log(chalk.gray('Environment Check:'));
console.log('  OPENAI_API_KEY:', process.env.OPENAI_API_KEY ? chalk.green('✓ Set') : chalk.red('✗ Missing'));
console.log('  OPENAI_BASE_URL:', process.env.OPENAI_BASE_URL ? chalk.green('✓ Set') : chalk.red('✗ Missing'));

if (!process.env.OPENAI_API_KEY || !process.env.OPENAI_BASE_URL) {
  console.log(chalk.red('\n❌ Missing environment variables in .env file'));
  process.exit(1);
}

console.log(chalk.gray('\nAPI Configuration:'));
console.log('  Base URL:', chalk.cyan(process.env.OPENAI_BASE_URL));
console.log('  API Key:', chalk.cyan(process.env.OPENAI_API_KEY.substring(0, 10) + '...'));

// Initialize client
const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY,
  baseURL: process.env.OPENAI_BASE_URL,
});

// Test different model names
const modelsToTest = [
  'apac.anthropic.claude-sonnet-4-20250514-v1:0',
];

async function testModel(modelName) {
  console.log(chalk.yellow(`\n🧪 Testing model: ${modelName}`));

  try {
    const response = await openai.chat.completions.create({
      model: modelName,
      messages: [
        { role: 'user', content: 'Hello! Please respond with just "OK" to confirm the connection works.' }
      ],
      max_tokens: 50,
      temperature: 0.7
    });

    const reply = response.choices[0].message.content;
    console.log(chalk.green(`✓ Success! Model "${modelName}" works!`));
    console.log(chalk.gray(`  Response: ${reply}`));
    return modelName;
  } catch (error) {
    console.log(chalk.red(`✗ Failed with model "${modelName}"`));
    console.log(chalk.gray(`  Error: ${error.message}`));
    if (error.status) {
      console.log(chalk.gray(`  Status: ${error.status}`));
    }
    return null;
  }
}

async function testConnection() {
  console.log(chalk.blue('\n📡 Testing different model names...\n'));

  let workingModel = null;

  for (const model of modelsToTest) {
    const result = await testModel(model);
    if (result) {
      workingModel = result;
      break;
    }
    // Wait a bit between requests
    await new Promise(resolve => setTimeout(resolve, 1000));
  }

  if (workingModel) {
    console.log(chalk.green(`\n✅ Connection successful!`));
    console.log(chalk.cyan(`\nUse this model in your .env file:`));
    console.log(chalk.white(`CLAUDE_MODEL=${workingModel}\n`));

    console.log(chalk.gray('Update claude-project.js to use this model:'));
    console.log(chalk.gray(`  model: process.env.CLAUDE_MODEL || '${workingModel}',\n`));
  } else {
    console.log(chalk.red(`\n❌ None of the models worked`));
    console.log(chalk.yellow('\n💡 Possible issues:'));
    console.log(chalk.yellow('1. Check if your proxy is running and accessible'));
    console.log(chalk.yellow('2. Verify your API key is correct'));
    console.log(chalk.yellow('3. Check if the base URL is correct (should end with /api/v1)'));
    console.log(chalk.yellow('4. Contact your proxy administrator for the correct model name'));
    console.log(chalk.yellow('5. Try accessing the URL in browser: ' + process.env.OPENAI_BASE_URL));
  }
}

// Alternative: Test with raw fetch
async function testWithFetch() {
  console.log(chalk.blue('\n🔧 Testing with raw HTTP request...\n'));

  try {
    const response = await fetch(`${process.env.OPENAI_BASE_URL}/chat/completions`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${process.env.OPENAI_API_KEY}`
      },
      body: JSON.stringify({
        model: 'apac.anthropic.claude-sonnet-4-20250514-v1:0',
        messages: [
          { role: 'user', content: 'Hello' }
        ],
        max_tokens: 50
      })
    });

    console.log(chalk.gray('Response status:'), response.status);
    console.log(chalk.gray('Response headers:'), JSON.stringify(Object.fromEntries(response.headers), null, 2));

    const data = await response.text();
    console.log(chalk.gray('Response body:'), data.substring(0, 500));

    if (response.ok) {
      console.log(chalk.green('✓ Raw HTTP request successful!'));
      try {
        const json = JSON.parse(data);
        console.log(chalk.gray('Parsed response:'), JSON.stringify(json, null, 2));
      } catch (e) {
        console.log(chalk.yellow('Response is not JSON'));
      }
    } else {
      console.log(chalk.red('✗ HTTP request failed'));
    }
  } catch (error) {
    console.error(chalk.red('Error with raw request:'), error.message);
  }
}

// Run tests
(async () => {
  await testConnection();
  await testWithFetch();
})();