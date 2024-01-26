import 'package:geocoding/geocoding.dart';

class MapsUtil {
  static String convertToAddress(Placemark? placemark) {
    if (placemark == null) return '';
    return '${placemark.street}, ${placemark.subLocality} ${placemark.locality} ${placemark.subAdministrativeArea} ${placemark.administrativeArea} ${placemark.postalCode}';
  }
}
