import 'dart:async';
import 'package:speech_to_text/speech_recognition_error.dart';

import 'index.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_recognition_result.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    stt.SpeechToText _speechToText = stt.SpeechToText();
    bool isVoiceEnabled = false;
    on<HomeVoiceOverInititalize>((event, emit) async {
      emit(HomeVoiceInitializing());

      try {
        await _speechToText.initialize(
            onError: (SpeechRecognitionError speechRecognitionError) {
              print(speechRecognitionError.errorMsg);
              emit(HomeVoiceInitializedFailed(
                  error: speechRecognitionError.errorMsg));
            },
            onStatus: _onSpeechListening);
      } catch (ex, stack) {
        emit(HomeVoiceInitializedFailed(error: ex.toString()));
      }
    });

    on<HomeVoiceOverPressed>((event, emit) async {
      emit(HomeVoiceIListening());
      try {
        if (isVoiceEnabled) {
          await _speechToText.stop();
        } else {
          await _speechToText.listen(onResult: _onSpeechResult);
        }
      } catch (ex, stack) {
        emit(HomeVoiceIListenedFailed(error: ex.toString()));
      }
    });

    on<OnHomeVoiceOverListening>((event, emit) async {
      emit(OnHomeVoiceIListeningSuccess());
    });

    on<OnHomeVoiceOverFetched>((event, emit) async {
      emit(VoiceDataReceiving());
      emit(VoiceDataReceived(text: event.data));
    });
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    this.add(OnHomeVoiceOverFetched(data: result.recognizedWords));
  }

  void _onSpeechListening(String result) {
    this.add(OnHomeVoiceOverListening());
  }
}
