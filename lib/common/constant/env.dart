class Env {
  Env(this.baseUrl);

  final String baseUrl;
}

mixin EnvValue {
  static final Env development = Env('https://engage.datalyticx.ai/api/');
  static final Env staging = Env('https://engage.datalyticx.ai/api/');
  static final Env production = Env('https://engage.datalyticx.ai/api/');
}
