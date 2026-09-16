import 'quiz_question.dart';

/// A named group of quiz questions, for example "Beginner" or "Advanced".
class QuizLevel {
  const QuizLevel({
    required this.id,
    required this.title,
    required this.description,
    required this.questions,
  });

  final String id;
  final String title;
  final String description;
  final List<QuizQuestion> questions;
}
