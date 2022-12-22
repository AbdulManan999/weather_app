import 'weather_data.dart';

class Weather {
  String cod;
  String message;
  List<WeatherData> weatherData;

  Weather();

  Weather.withFields({this.cod, this.message, this.weatherData});

  static Weather getWeatherFromMap(Map<String, dynamic> response) {
    List weatherDataList = response["list"];
    List<WeatherData> weatherList = [];
    try {
      if (weatherDataList.length != 0) {
        for (int i = 0; i < weatherDataList.length; i++) {
          weatherList
              .add(WeatherData.getWeatherDataFromMap(weatherDataList[i]));
        }
      } else {
        weatherList = [];
      }
    } catch (ex) {
      weatherList = [];
    }
    return Weather.withFields(
      cod: response["cod"],
      message: response["message"].toString(),
      weatherData: weatherList,
    );
  }
}
