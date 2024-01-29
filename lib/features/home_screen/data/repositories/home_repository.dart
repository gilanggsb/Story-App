import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:story_app/common/common.dart';
import 'package:story_app/features/maps_screen/data/data.dart';

import '../data.dart';

class HomeRepository {
  final ApiService _apiService = ApiService.instance;
  final MapsRepository _mapsRepository = MapsRepository.instance;

  Future<List<Story>> getStories({ReqStories? reqStories}) async {
    try {
      final BaseResponse res = await _apiService.get(URL.storiesUrl,
          dataKey: 'listStory', queryParams: reqStories?.toJson());

      List<Story> storyList = [];
      if (res.data == null || res.data.runtimeType != List) {
        return storyList;
      }

      for (var element in (res.data as List)) {
        Story story = Story.fromJson(element);

        /// Get Location
        if (story.lon != null && story.lat != null) {
          final Placemark placemark =
              await _mapsRepository.getLocation(LatLng(story.lat!, story.lon!));
          story = story.copyWith(placemark: placemark);
        }

        storyList.add(story);
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
