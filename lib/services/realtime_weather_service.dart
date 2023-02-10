import 'dart:convert';

import 'package:cloudsky/config/http_config.dart';
import 'package:cloudsky/models/realtime_weather_model.dart';
import 'package:http/http.dart' as http;

class RealtimeWeatherService extends HttpConfig {
  Future<RealtimeWeatherModel> fetchRealtimeWeather(
      {required double latitude, required double longitude}) async {
    final response = await http.get(
        Uri.parse(
            'https://weatherapi-com.p.rapidapi.com/current.json?q=$latitude,$longitude'),
        headers: super.headers);

    if (response.statusCode == 200) {
      return RealtimeWeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Realtime Weather.');
    }
  }
}
