import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ads/ad_ids.dart';
import '../ads/banner_ad_slot.dart';
import '../controllers/content_controller.dart';
import '../widgets/empty_state.dart';
import '../widgets/topic_tile.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.categoryId});

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    final content = Get.find<ContentController>();
    final theme = Theme.of(context);
    final isTopRoute = ModalRoute.of(context)?.isCurrent ?? true;

    return Obx(() {
      final category = content.categoryById(categoryId);
      if (category == null) {
        return Scaffold(
          appBar: AppBar(),
          body: const EmptyState(
            icon: Icons.error_outline,
            title: 'Category not found',
          ),
        );
      }

      return Scaffold(
        appBar: AppBar(title: Text(category.title)),
        body: ListView(
          padding: const EdgeInsets.only(bottom: 24),
          children: [
            if (category.description.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  category.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ...category.topics.map((topic) => TopicTile(topic: topic)),
            if (isTopRoute) ...[
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: BannerAdSlot(ids: AdIds.categoryBanner),
              ),
            ],
          ],
        ),
      );
    });
  }
}
