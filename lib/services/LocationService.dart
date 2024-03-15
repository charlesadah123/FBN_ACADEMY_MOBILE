import 'package:geolocator/geolocator.dart';

import '../common/Constants.dart';

class LocationService {

  Future<Position> _determinePosition() async {
    // Check if location services are enabled.
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationServiceException('Location services are disabled.');
    }

    // Check location permissions.
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw LocationServiceException('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw LocationServiceException(
          'Location permissions are permanently denied. Cannot request permissions.');
    }

    // Get the current position.
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }


  Future<double> calculateProximity() async {
    Position position= await _determinePosition();

    return await Geolocator.distanceBetween(
      position.latitude,
      position.longitude,
      MyConstants.firstAcademyLat,
      MyConstants.firstAcademyLong,
    );
  }
}

/// Custom exception class for location service errors.
class LocationServiceException implements Exception {
  final String message;

  LocationServiceException(this.message);

  @override
  String toString() => 'LocationServiceException: $message';
}
