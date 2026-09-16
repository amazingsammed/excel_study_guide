import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/quiz_question.dart';
import '../models/topic.dart';

/// Reads the offline study guide content bundled in `assets/content`.
class ContentRepository {
  static const String _basePath = 'assets/content';
  static const String _manifestPath = '$_basePath/manifest.json';
  static const String _quizPath = '$_basePath/quiz.json';

  final Map<String, String> _markdownCache = <String, String>{};

  Future<List<TopicCategory>> loadCategories() async {
    final raw = await rootBundle.loadString(_manifestPath);
    final data = json.decode(raw) as Map<String, dynamic>;
    final categories =
        data['categories'] as List<dynamic>? ?? const <dynamic>[];
    return categories
        .map(
          (category) =>
              TopicCategory.fromJson(category as Map<String, dynamic>),
        )
        .toList(growable: false);
  }

  Future<List<QuizQuestion>> loadQuiz() async {
    final raw = await rootBundle.loadString(_quizPath);
    final data = json.decode(raw) as Map<String, dynamic>;
    final questions = data['questions'] as List<dynamic>? ?? const <dynamic>[];
    return questions
        .map(
          (question) => QuizQuestion.fromJson(question as Map<String, dynamic>),
        )
        .toList(growable: false);
  }

  Future<String> loadMarkdown(String file) async {
    final cached = _markdownCache[file];
    if (cached != null) {
      return cached;
    }
    final content = await rootBundle.loadString('$_basePath/$file');
    _markdownCache[file] = content;
    return content;
  }
}
