import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:story_app/common/common.dart';
import 'package:story_app/features/maps_screen/data/data.dart';

import '../../home_screen/data/data.dart';

class DetailStoryRepository {
  final ApiService _apiService = ApiService.instance;
  final MapsRepository _mapsRepository = MapsRepository.instance;

  Future<Story> getStory(String storyId) async {
    try {
      final BaseResponse res =
          await _apiService.get('${URL.storiesUrl}/$storyId', dataKey: 'story');

      Story story = Story.fromJson(res.data);
      if (story.lat != null && story.lon != null) {
        final Placemark placemark =
            await _mapsRepository.getLocation(LatLng(story.lat!, story.lon!));
        story = story.copyWith(placemark: placemark);
      }
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
