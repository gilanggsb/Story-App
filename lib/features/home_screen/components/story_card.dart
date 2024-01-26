import 'package:flutter/material.dart';
import 'package:story_app/common/common.dart';

import '../data/data.dart';

class StoryCard extends StatelessWidget {
  final Story story;
  final VoidCallback onPress;
  const StoryCard({super.key, required this.story, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
        onTap: onPress,
        contentPadding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(
            color: AppColors.blackColor,
          ),
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: DefaultImage(
            width: 48,
            height: 48,
            fit: BoxFit.fill,
            imageUrl: story.photoUrl ?? '',
            cacheKey: story.id ?? '',
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultText(
              story.name ?? '',
              color: AppColors.blackColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            DefaultText(
              story.placemark?.subAdministrativeArea ?? '',
              color: AppColors.blackColor,
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
          ],
        ),
        subtitle: DefaultText(
          story.description ?? '',
          color: AppColors.blackColor,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}
