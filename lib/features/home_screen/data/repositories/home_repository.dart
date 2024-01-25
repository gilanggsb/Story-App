import 'package:story_app/common/common.dart';

import '../data.dart';

class HomeRepository {
  final ApiService _apiService = ApiService.instance;

  Future<List<Story>> getStories({ReqStories? reqStories}) async {
    try {
      final BaseResponse res = await _apiService.get(URL.storiesUrl,
          dataKey: 'listStory', queryParams: reqStories?.toJson());

      List<Story> storyList = [];
      if (res.data == null || res.data.runtimeType != List) {
        return storyList;
      }

      for (var element in (res.data as List)) {
        storyList.add(Story.fromJson(element));
      }

      return storyList;
    } on ServerException catch (e) {
      throw e.message;
    } on Failure catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}
