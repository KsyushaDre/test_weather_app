import 'package:test_weather_app/data/models/weather_api_model.dart';
import 'package:test_weather_app/domain/domain_models/weather_data.dart';

extension ConvertToWeatherData on WeatherApiModel {
  WeatherData toWeatherDataModel() {
    List<DayForecastData> dayForecastDataList = [];

    for (var element in forecast.forecastday) {
      dayForecastDataList.add(DayForecastData(
        date: element.date,
        conditionDesc: element.day.condition.text,
        maxTempCelsius: element.day.maxtemp_c,
        minTempCelsius: element.day.mintemp_c,
        maxWindVelocityKpH: element.day.maxwind_kph,
      ));
    }

    return WeatherData(
      updateDate: DateTime.now(),
      currentWeatherData: CurrentWeatherData(
        locationName: location.name,
        currentConditionDesc: current.condition.text,
        currentTempCelsius: current.temp_c,
        feelsLikeCelsius: current.feelslike_c,
        windVelocityKpH: current.wind_kph,
        windDirection: current.wind_dir,
      ),
      dailyForecast: dayForecastDataList,
    );
  }
}
