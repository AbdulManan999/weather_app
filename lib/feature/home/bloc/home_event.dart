import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/common/constant/env.dart';
import 'package:weather_app/common/model/weather.dart';

class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class HomeVoiceOverInititalize extends HomeEvent {}

class OnHomeVoiceOverListening extends HomeEvent {}

class HomeVoiceOverPressed extends HomeEvent {}

class OnHomeVoiceOverFetched extends HomeEvent {
  final String data;

  OnHomeVoiceOverFetched({@required this.data});
}

class GetWeatherData extends HomeEvent {
  final String city;
  final Env env;

  GetWeatherData({@required this.city, @required this.env});
}

class FilterWeatherData extends HomeEvent {
  final Weather weather;

  FilterWeatherData({@required this.weather});
}
