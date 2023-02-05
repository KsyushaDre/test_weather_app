import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_weather_app/domain/domain_models/weather_data.dart';
import 'package:test_weather_app/domain/repository/weather_repository.dart';

const String _weatherDataKey = 'weatherDataKey';

class WeatherRepositoryImpl implements WeatherRepository {
  SharedPreferences? _sharedPref;

  Future<void> _initSharedPrefInstance() async {
    _sharedPref ??= await SharedPreferences.getInstance();
  }

  @override
  Future<WeatherData?> getWeatherData() async {
    try {
      await _initSharedPrefInstance();
      final String? data = _sharedPref!.getString(_weatherDataKey);
      if (data != null) {
        return WeatherData.fromJson(json.decode(data));
      } else {
        return null;
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> saveWeatherData(WeatherData weatherData) async {
    try {
      await _initSharedPrefInstance();
      final String data = json.encode(weatherData.toJson());
      final bool isSet = await _sharedPref!.setString(_weatherDataKey, data);
      if (!isSet) {
        throw Exception('Could not save data to local storage.');
      }
    } catch (_) {
      rethrow;
    }
  }
}
