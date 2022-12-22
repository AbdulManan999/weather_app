import 'weather_data_main.dart';
import 'weather_data_weather.dart';
import 'weather_data_wind.dart';

class CurrentWeather {
  String cod;
  String message;
  WeatherDataMain main;
  List<WeatherDataWeather> weather;
  WeatherDataWind wind;

  CurrentWeather();

  CurrentWeather.withFields(
      {this.cod, this.message, this.main, this.weather, this.wind});

  static CurrentWeather getWeatherFromMap(Map<String, dynamic> response) {
    WeatherDataMain weatherDataMain =
        WeatherDataMain.getWeatherDataMainFromMap(response: response["main"]);
    WeatherDataWind weatherDataWind =
        WeatherDataWind.getWeatherDataWindFromMap(response: response["wind"]);
    List weatherDataWeatherDataList = response["weather"];
    List<WeatherDataWeather> weatherDataWeatherList = [];
    try {
      if (weatherDataWeatherDataList.length != 0) {
        for (int i = 0; i < weatherDataWeatherDataList.length; i++) {
          weatherDataWeatherList.add(
              WeatherDataWeather.getWeatherDataWeatherFromMap(
                  response: weatherDataWeatherDataList[i]));
        }
      } else {
        weatherDataWeatherList = [];
      }
    } catch (ex) {
      weatherDataWeatherList = [];
    }
    return CurrentWeather.withFields(
      cod: response["cod"].toString(),
      message: response["message"].toString(),
      weather: weatherDataWeatherList,
      wind: weatherDataWind,
      main: weatherDataMain,
    );
  }
}
