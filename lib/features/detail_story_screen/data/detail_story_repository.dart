import 'package:story_app/common/common.dart';

import '../../home_screen/data/data.dart';

class DetailStoryRepository {
  final ApiService _apiService = ApiService.instance;

  Future<Story> getStory(String storyId) async {
    try {
      final BaseResponse res =
          await _apiService.get('${URL.storiesUrl}/$storyId', dataKey: 'story');

      Story story = Story.fromJson(res.data);
      return story;
    } on ServerException catch (e) {
      throw e.message;
    } on Failure catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}
