import 'package:geolocator/geolocator.dart';

class Geolocation {
  Future<Position?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Comprueba si los servicios de ubicación están habilitados
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Los servicios de ubicación no están habilitados, devuelve null
      print("Los servicios de ubicación están deshabilitados.");
      return null;
    }

    // Comprueba los permisos de ubicación
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Los permisos están denegados, devuelve null
        print("Los permisos de ubicación están denegados.");
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Los permisos están denegados para siempre, devuelve null
      print("Los permisos de ubicación están denegados para siempre.");
      return null;
    }

    // Obtén la posición actual con alta precisión
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    return position;
  }
}
