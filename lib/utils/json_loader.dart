import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/learning_item.dart';
import '../models/meaning_item.dart';
import '../models/daily_item.dart';

class JsonLoader {
  /// -------------------- LOAD LEARNING --------------------
  static Future<List<LearningItem>> loadLearning() async {
    try {
      final String jsonString =
      await rootBundle.loadString('assets/data/learning.json');
      final List<dynamic> jsonData = json.decode(jsonString);

      return jsonData.map((e) => LearningItem.fromJson(e)).toList();
    } catch (e) {
      print("Error loading learning.json → $e");
      return [];
    }
  }

  /// -------------------- LOAD MEANING --------------------
  static Future<List<MeaningItem>> loadMeaning() async {
    try {
      final String jsonString =
      await rootBundle.loadString('assets/data/meaning.json');
      final List<dynamic> jsonData = json.decode(jsonString);

      return jsonData.map((e) => MeaningItem.fromJson(e)).toList();
    } catch (e) {
      print("Error loading meaning.json → $e");
      return [];
    }
  }

  /// -------------------- LOAD DAILY CONTENT --------------------
  static Future<List<DailyItem>> loadDaily() async {
    try {
      final String jsonString =
      await rootBundle.loadString('assets/data/daily_content.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);

      return (jsonData["daily"] as List)
          .map((e) => DailyItem.fromJson(e))
          .toList();
    } catch (e) {
      print("Error loading daily_content.json → $e");
      return [];
    }
  }
}
