class WeatherDataMain {
  double temp;
  double feels_like;
  double temp_min;
  double temp_max;
  double pressure;
  double sea_level;
  double grnd_level;
  double humidity;
  double temp_kf;

  WeatherDataMain();

  WeatherDataMain.withFields({
    this.temp,
    this.feels_like,
    this.temp_min,
    this.temp_max,
    this.pressure,
    this.sea_level,
    this.grnd_level,
    this.humidity,
    this.temp_kf,
  });

  static WeatherDataMain getWeatherDataMainFromMap(
      {Map<String, dynamic> response}) {
    double temp;
    try {
      temp = double.parse(response["temp"].toString());
    } catch (ex) {
      temp = null;
    }
    double feels_like;
    try {
      feels_like = double.parse(response["feels_like"].toString());
    } catch (ex) {
      feels_like = null;
    }
    double temp_min;
    try {
      temp_min = double.parse(response["temp_min"].toString());
    } catch (ex) {
      temp_min = null;
    }
    double temp_max;
    try {
      temp_max = double.parse(response["temp_max"].toString());
    } catch (ex) {
      temp_max = null;
    }
    double pressure;
    try {
      pressure = double.parse(response["pressure"].toString());
    } catch (ex) {
      pressure = null;
    }
    double sea_level;
    try {
      sea_level = double.parse(response["sea_level"].toString());
    } catch (ex) {
      sea_level = null;
    }
    double grnd_level;
    try {
      grnd_level = double.parse(response["grnd_level"].toString());
    } catch (ex) {
      grnd_level = null;
    }
    double humidity;
    try {
      humidity = double.parse(response["humidity"].toString());
    } catch (ex) {
      humidity = null;
    }
    double temp_kf;
    try {
      temp_kf = double.parse(response["temp_kf"].toString());
    } catch (ex) {
      temp_kf = null;
    }
    return WeatherDataMain.withFields(
      temp: temp,
      feels_like: feels_like,
      temp_min: temp_min,
      temp_max: temp_max,
      pressure: pressure,
      sea_level: sea_level,
      grnd_level: grnd_level,
      humidity: humidity,
      temp_kf: temp_kf,
    );
  }
}
