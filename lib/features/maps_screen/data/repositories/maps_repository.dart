import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:story_app/common/common.dart';

class MapsRepository {
  static MapsRepository? _instance;

  MapsRepository._();

  static MapsRepository get instance => _instance ??= MapsRepository._();

  Future<Placemark> getLocation(LatLng latLong) async {
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
