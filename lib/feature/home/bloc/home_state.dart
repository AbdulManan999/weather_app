import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

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
