import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:leo_thap_tu_vung/src/models/vocabulary_item.dart';

class VocabularyRepository {
  List<VocabularyItem> _vocabulary = [];

  /// Loads the vocabulary list from the JSON asset.
  Future<void> loadVocabulary() async {
    if (_vocabulary.isNotEmpty) return;
    
    try {
      final jsonString = await rootBundle.loadString('assets/data/initial_vocabulary.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      _vocabulary = jsonList.map((json) => VocabularyItem.fromJson(json)).toList();
    } catch (e) {
      print("Error loading vocabulary: $e");
      _vocabulary = []; 
    }
  }

  Future<List<VocabularyItem>> getAllVocabulary() async {
    await loadVocabulary();
    return _vocabulary;
  }

  // FIX: Added this method to satisfy LessonController
  Future<List<VocabularyItem>> getInitialVocabulary() async {
    return getAllVocabulary();
  }

  Future<VocabularyItem?> getVocabularyById(String id) async {
    await loadVocabulary();
    try {
      return _vocabulary.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<List<VocabularyItem>> getDistractors(VocabularyItem correctWord, int count) async {
    await loadVocabulary();
    
    if (_vocabulary.length <= count) {
      return _vocabulary.where((w) => w.id != correctWord.id).toList();
    }

    final random = Random();
    final distractors = <VocabularyItem>{};

    while (distractors.length < count) {
      final randomIndex = random.nextInt(_vocabulary.length);
      final word = _vocabulary[randomIndex];
      
      if (word.id != correctWord.id) {
        distractors.add(word);
      }
    }

    final options = distractors.toList();
    options.add(correctWord);
    options.shuffle();
    
    return options;
  }
}