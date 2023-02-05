class WeatherData {
  final CurrentWeatherData currentWeatherData;
  final List<DayForecastData> dailyForecast;

  WeatherData({
    required this.currentWeatherData,
    required this.dailyForecast,
  });
}

class CurrentWeatherData {
  final String locationName;
  final String currentConditionDesc;
  final double currentTempCelsius;
  final double feelsLikeCelsius;
  final double windVelocityKpH;
  final String windDirection;

  CurrentWeatherData({
    required this.locationName,
    required this.currentConditionDesc,
    required this.currentTempCelsius,
    required this.feelsLikeCelsius,
    required this.windVelocityKpH,
    required this.windDirection,
  });
}

class DayForecastData {
  final DateTime date;
  final String conditionDesc;
  final double maxTempCelsius;
  final double minTempCelsius;
  final double maxWindVelocityKpH;

  DayForecastData({
    required this.date,
    required this.conditionDesc,
    required this.maxTempCelsius,
    required this.minTempCelsius,
    required this.maxWindVelocityKpH,
  });
}
