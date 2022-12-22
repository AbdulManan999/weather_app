class Env {
  Env(this.baseUrl);

  final String baseUrl;
}

mixin EnvValue {
  static final Env development = Env('http://api.openweathermap.org/data/2.5/');
  static final Env staging = Env('http://api.openweathermap.org/data/2.5/');
  static final Env production = Env('http://api.openweathermap.org/data/2.5/');
}
