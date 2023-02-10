import 'package:cloudsky/models/realtime_weather_model.dart';
import 'package:cloudsky/services/realtime_weather_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController with StateMixin {
  final RealtimeWeatherService realtimeWeatherService =
      RealtimeWeatherService();
  Position? currentPosition;
  RealtimeWeatherModel? realtimeWeatherModel;

  @override
  Future<void> onInit() async {
    super.onInit();

    change(null, status: RxStatus.loading());
    currentPosition = await _determinePosition();
    await fetchRealtimeWeather(
        latitude: currentPosition!.latitude,
        longitude: currentPosition!.longitude);
    change(null, status: RxStatus.success());
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<RealtimeWeatherModel> fetchRealtimeWeather(
          {required double latitude, required double longitude}) async =>
      realtimeWeatherModel = await realtimeWeatherService.fetchRealtimeWeather(
          latitude: latitude, longitude: longitude);
}
