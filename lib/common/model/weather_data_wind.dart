class WeatherDataWind {
  double speed;
  double deg;
  double gust;

  WeatherDataWind();
  WeatherDataWind.withFields({this.speed, this.deg, this.gust});
  static WeatherDataWind getWeatherDataWindFromMap(
      {Map<String, dynamic> response}) {
    double speed;
    try {
      speed = double.parse(response["speed"].toString());
    } catch (ex) {
      speed = null;
    }
    double deg;
    try {
      deg = double.parse(response["deg"].toString());
    } catch (ex) {
      deg = null;
    }
    double gust;
    try {
      gust = double.parse(response["gust"].toString());
    } catch (ex) {
      gust = null;
    }

    return WeatherDataWind.withFields(
      speed: speed,
      deg: deg,
      gust: gust,
    );
  }
}
