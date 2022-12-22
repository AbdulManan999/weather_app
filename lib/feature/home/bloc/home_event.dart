import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

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
