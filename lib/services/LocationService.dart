import 'package:geolocator/geolocator.dart';

import '../common/Constants.dart';

class LocationService {

  Future<Position> determinePosition() async {
    // Check if location services are enabled.
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationServiceException('Location services are disabled.');
      //show a dialog here
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


  Future<double> calculateProximity(double lat, double lon) async {
    Position position= await determinePosition();

    print("first Lat $lat");
    print("first lon $lon");
    print("current Lat ${position.latitude}");
    print("current lon ${position.longitude}");

    return await Geolocator.distanceBetween(
      position.latitude,
      position.longitude,
      lat,
      lon,
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
