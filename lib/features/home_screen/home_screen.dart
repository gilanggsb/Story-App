import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common/common.dart';
import 'components/components.dart';
import 'controllers/controllers.dart';
import 'data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeProvider homeProvider = HomeProvider.instance;
  void getStories() {
    Timer(const Duration(seconds: 1), () {
      homeProvider.getStories();
    });
  }

  void onPressLogout() {
    homeProvider.logout();
  }

  void onPressStoryCard(Story story) {
    homeProvider.gotoDetailStory(story.id ?? '');
  }

  void onPressAddStory() async {
    homeProvider.gotoAddStory();
  }

  @override
  void initState() {
    super.initState();
    getStories();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: DefaultAppBar(
        title: 'Stories',
        actions: [
          DefaultButton(
            onPress: onPressLogout,
            backgroundColor: Colors.transparent,
            padding: const EdgeInsets.all(10),
            child: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressAddStory,
        backgroundColor: AppColors.blackColor,
        mini: true,
        child: const Icon(
          Icons.add,
          color: AppColors.whiteColor,
        ),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: value.stories.length,
            itemBuilder: (context, index) {
              final Story story = value.stories[index];
              return StoryCard(
                story: story,
                onPress: () => onPressStoryCard(story),
              );
            },
          );
        },
      ),
    );
  }
}
