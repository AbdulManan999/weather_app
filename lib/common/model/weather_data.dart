import 'weather_data_main.dart';
import 'weather_data_weather.dart';
import 'weather_data_wind.dart';

class WeatherData {
  String date;
  WeatherDataMain main;
  List<WeatherDataWeather> weather;
  WeatherDataWind wind;
  String dateInText;

  WeatherData();
  WeatherData.withFields({
    this.date,
    this.main,
    this.wind,
    this.weather,
    this.dateInText,
  });

  static WeatherData getWeatherDataFromMap(Map<String, dynamic> response) {
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

    return WeatherData.withFields(
      date: response["dt"].toString(),
      main: weatherDataMain,
      weather: weatherDataWeatherList,
      wind: weatherDataWind,
      dateInText: response["dt_txt"],
    );
  }
}
