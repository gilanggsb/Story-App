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
    homeProvider.getStories();
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
    homeProvider.scrollController.addListener(() {
      if (homeProvider.scrollController.position.pixels >=
          homeProvider.scrollController.position.maxScrollExtent) {
        if (homeProvider.pageItems != null) {
          getStories();
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getStories();
    });

    super.initState();
  }

  @override
  void dispose() {
    // homeProvider.scrollController.dispose();
    super.dispose();
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
      body: Center(
        child: Consumer<HomeProvider>(
          builder: (context, value, child) {
            return ListView.builder(
              controller: homeProvider.scrollController,
              shrinkWrap: true,
              itemCount: homeProvider.stories.length +
                  (value.pageItems != null ? 1 : 0),
              itemBuilder: (context, index) {
                final state = value.homeState;
                if (index == homeProvider.stories.length &&
                    value.pageItems != null &&
                    state == HomeState.loading) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: DefaultCircularProgressIndicator(
                        color: AppColors.blackColor,
                      ),
                    ),
                  );
                }

                if (state == HomeState.loaded) {
                  final Story story = value.stories[index];
                  return StoryCard(
                    story: story,
                    onPress: () => onPressStoryCard(story),
                  );
                }

                return Center(
                  child: Column(
                    children: [
                      const DefaultText(
                        "Failed to fetch story",
                        color: AppColors.blackColor,
                      ),
                      DefaultButton(
                        margin: const EdgeInsets.only(top: 10),
                        onPress: getStories,
                        text: 'Refresh',
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
