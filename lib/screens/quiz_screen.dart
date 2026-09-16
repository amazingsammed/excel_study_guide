import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/quiz_controller.dart';
import '../models/quiz_level.dart';
import '../models/quiz_question.dart';
import '../widgets/empty_state.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = Get.find<QuizController>();
    return Obx(() {
      final level = quiz.activeLevel;
      return Scaffold(
        appBar: AppBar(
          title: Text(level?.title ?? 'Quiz'),
          leading: level == null
              ? null
              : IconButton(
                  tooltip: 'Back to levels',
                  icon: const Icon(Icons.arrow_back),
                  onPressed: quiz.exitLevel,
                ),
        ),
        body: _buildBody(quiz, level),
      );
    });
  }

  Widget _buildBody(QuizController quiz, QuizLevel? level) {
    if (quiz.isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    }
    if (quiz.error.value != null) {
      return EmptyState(
        icon: Icons.error_outline,
        title: 'Could not load the quiz',
        message: quiz.error.value,
      );
    }
    if (quiz.questions.isEmpty) {
      return const EmptyState(
        icon: Icons.quiz_outlined,
        title: 'No questions yet',
        message: 'Quiz questions will appear here once they are added.',
      );
    }
    if (level == null) {
      return _LevelList(quiz: quiz);
    }
    if (quiz.finished.value) {
      return _QuizResult(quiz: quiz, level: level);
    }
    return _QuizQuestionView(quiz: quiz);
  }
}

IconData _levelIcon(String id) {
  switch (id) {
    case 'beginner':
      return Icons.school_outlined;
    case 'intermediate':
      return Icons.insights_outlined;
    case 'advanced':
      return Icons.workspace_premium_outlined;
    default:
      return Icons.quiz_outlined;
  }
}

class _LevelList extends StatelessWidget {
  const _LevelList({required this.quiz});

  final QuizController quiz;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Obx(() {
      final levels = quiz.levels;
      return ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          Text(
            'Choose a level',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Answer each level to earn a score. Your best score is saved on '
            'this device so you can beat it later.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          for (final level in levels) _LevelCard(quiz: quiz, level: level),
        ],
      );
    });
  }
}

class _LevelCard extends StatelessWidget {
  const _LevelCard({required this.quiz, required this.level});

  final QuizController quiz;
  final QuizLevel level;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final total = level.questions.length;
    final best = quiz.bestFor(level.id);
    final attempted = best > 0;

    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => quiz.startLevel(level),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: scheme.primaryContainer,
                    foregroundColor: scheme.onPrimaryContainer,
                    child: Icon(_levelIcon(level.id)),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          level.title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          level.description,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: scheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.play_circle_outline, color: scheme.primary),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '$total question${total == 1 ? '' : 's'}',
                      style: theme.textTheme.labelMedium,
                    ),
                  ),
                  Text(
                    attempted ? 'Best $best / $total' : 'Not attempted',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: attempted
                          ? scheme.primary
                          : scheme.onSurfaceVariant,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: total == 0 ? 0 : best / total,
                  minHeight: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _OptionState { idle, correct, wrong }

class _QuizQuestionView extends StatelessWidget {
  const _QuizQuestionView({required this.quiz});

  final QuizController quiz;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Obx(() {
      final question = quiz.current;
      if (question == null) {
        return const SizedBox.shrink();
      }
      final selected = quiz.selected.value;
      final answered = quiz.answered;
      final total = quiz.activeQuestions.length;

      return ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Question ${quiz.index.value + 1} of $total',
                  style: theme.textTheme.labelLarge,
                ),
              ),
              Text(
                'Score ${quiz.score.value}',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(value: quiz.progress, minHeight: 8),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Chip(
              label: Text(question.category),
              visualDensity: VisualDensity.compact,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            question.question,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          for (var i = 0; i < question.options.length; i++)
            _OptionTile(
              label: question.options[i],
              state: _stateFor(i, question, selected, answered),
              onTap: answered ? null : () => quiz.select(i),
            ),
          if (answered) ...[
            const SizedBox(height: 8),
            _ExplanationCard(
              question: question,
              isCorrect: selected == question.answer,
            ),
          ],
          const SizedBox(height: 24),
          FilledButton(
            onPressed: answered ? quiz.next : null,
            child: Text(quiz.isLast ? 'See results' : 'Next question'),
          ),
        ],
      );
    });
  }

  _OptionState _stateFor(
    int index,
    QuizQuestion question,
    int? selected,
    bool answered,
  ) {
    if (!answered) {
      return _OptionState.idle;
    }
    if (index == question.answer) {
      return _OptionState.correct;
    }
    if (index == selected) {
      return _OptionState.wrong;
    }
    return _OptionState.idle;
  }
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({required this.label, required this.state, this.onTap});

  final String label;
  final _OptionState state;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    var background = scheme.surfaceContainerHighest;
    var border = scheme.outlineVariant;
    IconData? trailingIcon;

    if (state == _OptionState.correct) {
      background = scheme.primaryContainer;
      border = scheme.primary;
      trailingIcon = Icons.check_circle;
    } else if (state == _OptionState.wrong) {
      background = scheme.errorContainer;
      border = scheme.error;
      trailingIcon = Icons.cancel;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: background,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: border, width: 1.4),
            ),
            child: Row(
              children: [
                Expanded(child: Text(label, style: theme.textTheme.bodyLarge)),
                if (trailingIcon != null)
                  Icon(trailingIcon, color: border, size: 22),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ExplanationCard extends StatelessWidget {
  const _ExplanationCard({required this.question, required this.isCorrect});

  final QuizQuestion question;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final accent = isCorrect ? scheme.primary : scheme.error;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCorrect ? scheme.primaryContainer : scheme.errorContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                isCorrect ? Icons.check_circle : Icons.info,
                color: accent,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                isCorrect ? 'Correct!' : 'Not quite',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: accent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(question.explanation, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _QuizResult extends StatelessWidget {
  const _QuizResult({required this.quiz, required this.level});

  final QuizController quiz;
  final QuizLevel level;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Obx(() {
      final total = quiz.activeQuestions.length;
      final score = quiz.score.value;
      final percent = total == 0 ? 0 : (score / total * 100).round();
      final passed = percent >= 70;
      final best = quiz.bestFor(level.id);

      return ListView(
        padding: const EdgeInsets.all(24),
        children: [
          SvgPicture.asset('assets/images/quiz_result.svg', height: 200),
          const SizedBox(height: 24),
          Text(
            passed ? 'Great work!' : 'Keep practising',
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'You scored $score out of $total ($percent%)',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 4),
          Text(
            'Best score for ${level.title}: $best / $total',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 28),
          FilledButton(onPressed: quiz.restart, child: const Text('Try again')),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: quiz.exitLevel,
            child: const Text('Back to levels'),
          ),
        ],
      );
    });
  }
}
