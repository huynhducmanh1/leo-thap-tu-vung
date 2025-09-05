import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:leo_thap_tu_vung/src/models/vocabulary_item.dart';

class VocabularyRepository {
  /// Loads the initial list of vocabulary from the JSON asset file,
  /// parses it, and returns it as a list of VocabularyItem objects.
  Future<List<VocabularyItem>> getInitialVocabulary() async {
    // 1. Load the raw JSON string from the asset bundle.
    final jsonString = await rootBundle.loadString('assets/data/initial_vocabulary.json');

    // 2. Decode the JSON string into a Dart List of Maps.
    final List<dynamic> jsonList = json.decode(jsonString);

    // 3. Map the list of JSON objects to a list of VocabularyItem objects
    //    using the fromJson factory constructor we created.
    return jsonList.map((json) => VocabularyItem.fromJson(json)).toList();
  }
}