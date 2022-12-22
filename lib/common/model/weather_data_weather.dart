class WeatherDataWeather {
  String main;
  String description;

  WeatherDataWeather();

  WeatherDataWeather.withFields({this.main, this.description});

  static WeatherDataWeather getWeatherDataWeatherFromMap(
      {Map<String, dynamic> response}) {
    return WeatherDataWeather.withFields(
      main: response["main"],
      description: response["description"],
    );
  }
}
