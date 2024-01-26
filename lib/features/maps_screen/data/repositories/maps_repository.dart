import 'package:geocoding/geocoding.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:story_app/common/common.dart';

class MapsRepository {
  static MapsRepository? _instance;

  MapsRepository._();

  static MapsRepository get instance => _instance ??= MapsRepository._();

  Future<Placemark> getLocation(LatLong latLong) async {
    try {
      final List<Placemark> res = await placemarkFromCoordinates(
        latLong.latitude,
        latLong.longitude,
      );
      return res[0];
    } on ServerException catch (e) {
      throw e.message;
    } on Failure catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}
