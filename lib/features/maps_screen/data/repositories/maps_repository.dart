import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:story_app/common/common.dart';
import 'package:location/location.dart' as loc;

class MapsRepository {
  static MapsRepository? _instance;

  final loc.Location location = loc.Location();

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

  Future<(Placemark?, LatLng)> getUserLocation() async {
    try {
      loc.LocationData locationData = await location.getLocation();
      final LatLng latLng = LatLng(
          locationData.latitude ?? 50.5, locationData.longitude ?? 30.51);
      final res = await placemarkFromCoordinates(
          locationData.latitude!, locationData.longitude!);
      return (res[0], latLng);
    } on ServerException catch (e) {
      throw e.message;
    } on Failure catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}
