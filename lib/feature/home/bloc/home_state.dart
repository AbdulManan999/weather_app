import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/common/model/current_weather.dart';
import 'package:weather_app/common/model/weather.dart';
import 'package:weather_app/common/model/weather_data.dart';

class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeVoiceInitializing extends HomeState {}

class HomeVoiceInitializedSuccess extends HomeState {}

class HomeVoiceInitializedFailed extends HomeState {
  final String error;

  HomeVoiceInitializedFailed({@required this.error});
}

class HomeVoiceIListened extends HomeState {}

class HomeVoiceIListening extends HomeState {}

class HomeVoiceIListenedSuccess extends HomeState {}

class OnHomeVoiceIListeningSuccess extends HomeState {}

class OnHomeVoiceIListeningFailed extends HomeState {}

class HomeVoiceIListenedFailed extends HomeState {
  final String error;

  HomeVoiceIListenedFailed({@required this.error});
}

class VoiceDataReceived extends HomeState {
  final String text;

  VoiceDataReceived({@required this.text});
}

class VoiceDataReceiving extends HomeState {}

class WeatherDataGetting extends HomeState {}

class WeatherDataGot extends HomeState {
  final Weather weather;
  final CurrentWeather currentWeather;

  WeatherDataGot({@required this.weather, @required this.currentWeather});
}

class WeatherDataGetFailed extends HomeState {
  final String error;
  WeatherDataGetFailed({@required this.error});
}

class WeatherDataFiltering extends HomeState {}

class WeatherDataFiltered extends HomeState {
  final List<WeatherData> filteredWeatherData;

  WeatherDataFiltered({@required this.filteredWeatherData});
}

class WeatherDataFilterFailed extends HomeState {
  final String error;

  WeatherDataFilterFailed({@required this.error});
}
