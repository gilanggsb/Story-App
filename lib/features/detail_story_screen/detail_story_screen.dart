import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:story_app/features/maps_screen/utils/utils.dart';
import '../../common/common.dart';
import '../home_screen/data/data.dart';
import 'controllers/controllers.dart';

class DetailStoryScreen extends StatelessWidget {
  final DetailStoryProvider _detailStoryProvider;

  DetailStoryScreen({super.key})
      : _detailStoryProvider = DetailStoryProvider() {
    getDetailStory();
  }

  void getDetailStory() {
    Timer(const Duration(seconds: 1), () {
      _detailStoryProvider.getDetailStory();
    });
  }

  void openMap() => {_detailStoryProvider.openMaps()};

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _detailStoryProvider,
      child: Consumer<DetailStoryProvider>(
        builder: (context, value, child) {
          Story? story = value.story;
          return DefaultScaffold(
            appBar: const DefaultAppBar(
              title: 'Detail Story',
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 14,
                ),
                Center(
                  child: DefaultImage(
                    cacheKey: story?.id ?? '',
                    imageUrl: story?.photoUrl ?? '',
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultText(
                      story?.name ?? '',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                    DefaultText(
                      DateFormat('dd-MM-yyyy hh:mm a').format(
                        story?.createdAt ?? DateTime.now(),
                      ),
                      fontSize: 10,
                      color: AppColors.blackColor,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: openMap,
                  child: DefaultText(
                    decoration: TextDecoration.underline,
                    MapsUtil.convertToAddress(story?.placemark),
                    color: AppColors.blueColor,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                DefaultText(
                  story?.description ?? '',
                  color: AppColors.blackColor,
                ),
                const SizedBox(
                  height: 14,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
