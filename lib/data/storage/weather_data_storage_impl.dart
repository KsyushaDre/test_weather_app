import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_weather_app/data/storage/weather_data_storage.dart';
import 'package:test_weather_app/domain/domain_models/weather_data.dart';

const String _weatherDataKey = 'weatherDataKey';

class WeatherDataStorageImpl implements WeatherDataStorage {
  @override
  Future<WeatherData?> get() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    final String? data = sharedPref.getString(_weatherDataKey);
    if (data != null) {
      return WeatherData.fromJson(json.decode(data));
    } else {
      return null;
    }
  }

  @override
  Future<void> save(WeatherData weatherData) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    final String data = json.encode(weatherData.toJson());
    final bool isSet = await sharedPref.setString(_weatherDataKey, data);
    if (!isSet) {
      throw Exception('Could not save data to local storage.');
    }
  }
}
