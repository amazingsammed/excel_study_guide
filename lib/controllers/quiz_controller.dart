import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/content_repository.dart';
import '../models/quiz_level.dart';
import '../models/quiz_question.dart';

/// Drives the level-based quiz and persists the best score of each level on the
/// device using [SharedPreferences].
class QuizController extends GetxController {
  QuizController({ContentRepository? repository})
    : _repository = repository ?? ContentRepository();

  static const String _bestScoresKey = 'quiz_best_scores';

  static const List<({String id, String title, String description})> _levelMeta =
      <({String id, String title, String description})>[
        (
          id: 'beginner',
          title: 'Beginner',
          description: 'Cells, ranges and formula basics.',
        ),
        (
          id: 'intermediate',
          title: 'Intermediate',
          description: 'Formatting and working with data.',
        ),
        (
          id: 'advanced',
          title: 'Advanced',
          description: 'Lookups, conditions and core functions.',
        ),
      ];

  final ContentRepository _repository;

  final RxList<QuizQuestion> questions = <QuizQuestion>[].obs;
  final RxBool isLoading = true.obs;
  final RxnString error = RxnString();

  /// Best score achieved for each level, keyed by level id.
  final RxMap<String, int> bestScores = <String, int>{}.obs;

  /// The level currently being played, or `null` when the level list is shown.
  final RxnString activeLevelId = RxnString();

  final RxInt index = 0.obs;
  final RxnInt selected = RxnInt();
  final RxInt score = 0.obs;
  final RxBool finished = false.obs;

  List<QuizLevel> get levels {
    final grouped = <String, List<QuizQuestion>>{};
    for (final question in questions) {
      grouped.putIfAbsent(question.level, () => <QuizQuestion>[]).add(question);
    }
    return _levelMeta
        .where((meta) => grouped[meta.id]?.isNotEmpty ?? false)
        .map(
          (meta) => QuizLevel(
            id: meta.id,
            title: meta.title,
            description: meta.description,
            questions: List<QuizQuestion>.unmodifiable(grouped[meta.id]!),
          ),
        )
        .toList(growable: false);
  }

  QuizLevel? get activeLevel {
    final id = activeLevelId.value;
    if (id == null) {
      return null;
    }
    for (final level in levels) {
      if (level.id == id) {
        return level;
      }
    }
    return null;
  }

  List<QuizQuestion> get activeQuestions =>
      activeLevel?.questions ?? const <QuizQuestion>[];

  QuizQuestion? get current =>
      index.value >= 0 && index.value < activeQuestions.length
      ? activeQuestions[index.value]
      : null;

  bool get answered => selected.value != null;

  bool get isLast =>
      activeQuestions.isNotEmpty && index.value == activeQuestions.length - 1;

  double get progress {
    if (activeQuestions.isEmpty) {
      return 0;
    }
    return (index.value + (answered ? 1 : 0)) / activeQuestions.length;
  }

  int bestFor(String levelId) => bestScores[levelId] ?? 0;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    error.value = null;
    try {
      questions.assignAll(await _repository.loadQuiz());
      await _loadBestScores();
    } catch (exception) {
      error.value = exception.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _loadBestScores() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_bestScoresKey);
    if (raw == null || raw.isEmpty) {
      return;
    }
    try {
      final data = json.decode(raw) as Map<String, dynamic>;
      bestScores.assignAll(
        data.map((key, value) => MapEntry(key, value as int)),
      );
    } catch (_) {
      bestScores.clear();
    }
  }

  void startLevel(QuizLevel level) {
    activeLevelId.value = level.id;
    index.value = 0;
    selected.value = null;
    score.value = 0;
    finished.value = false;
  }

  void exitLevel() {
    activeLevelId.value = null;
    index.value = 0;
    selected.value = null;
    score.value = 0;
    finished.value = false;
  }

  void select(int option) {
    if (answered || current == null) {
      return;
    }
    selected.value = option;
    if (option == current!.answer) {
      score.value++;
    }
  }

  Future<void> next() async {
    if (!answered) {
      return;
    }
    if (isLast) {
      await _finish();
      return;
    }
    index.value++;
    selected.value = null;
  }

  Future<void> _finish() async {
    finished.value = true;
    final level = activeLevel;
    if (level == null || score.value <= bestFor(level.id)) {
      return;
    }
    bestScores[level.id] = score.value;
    await _saveBestScores();
  }

  Future<void> _saveBestScores() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_bestScoresKey, json.encode(bestScores));
  }

  Future<void> clearScores() async {
    bestScores.clear();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_bestScoresKey);
  }

  void restart() {
    index.value = 0;
    selected.value = null;
    score.value = 0;
    finished.value = false;
  }
}
