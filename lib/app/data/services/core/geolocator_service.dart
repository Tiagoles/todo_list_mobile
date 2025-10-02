import 'package:geolocator/geolocator.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/exceptions/core_exceptions.dart';

class GeolocatorService{

  LocationPermission _permission = LocationPermission.denied;

  Future<void> init() async {
    _permission = await Geolocator.checkPermission();
    if(_permission == LocationPermission.denied){
      _permission = await Geolocator.requestPermission();
    }
  }

  AsyncResult<Position> getCurrentLocation() async {

    bool serviceEnabled;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Failure(GeolocatorException('O serviço de localização está desativado.'));
    }

    if (_permission == LocationPermission.denied) {
      return Failure(GeolocatorException('As permissões de localização foram negadas.'));
    }

    if (_permission == LocationPermission.deniedForever) {
      return Failure(GeolocatorException('As permissões de localização foram negadas permanentemente.'));
    }

    return Success(await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high
      )
    ));
  }
}