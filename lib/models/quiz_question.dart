class QuizQuestion {
  const QuizQuestion({
    required this.id,
    required this.level,
    required this.category,
    required this.question,
    required this.options,
    required this.answer,
    required this.explanation,
  });

  final String id;
  final String level;
  final String category;
  final String question;
  final List<String> options;
  final int answer;
  final String explanation;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    final rawOptions = json['options'] as List<dynamic>? ?? const <dynamic>[];
    return QuizQuestion(
      id: json['id'] as String? ?? '',
      level: json['level'] as String? ?? 'beginner',
      category: json['category'] as String? ?? '',
      question: json['question'] as String? ?? '',
      options: rawOptions
          .map((option) => option as String)
          .toList(growable: false),
      answer: json['answer'] as int? ?? 0,
      explanation: json['explanation'] as String? ?? '',
    );
  }
}
