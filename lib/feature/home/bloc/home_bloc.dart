import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:weather_app/common/http/response.dart';
import 'package:weather_app/common/model/current_weather.dart';
import 'package:weather_app/common/model/weather.dart';
import 'package:weather_app/common/model/weather_data.dart';
import 'package:weather_app/feature/home/resource/home_repository.dart';

import 'index.dart';

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
        emit(HomeVoiceInitializedSuccess());
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

    on<GetWeatherData>((event, emit) async {
      emit(WeatherDataGetting());
      try {
        HomeRepository homeRepository = HomeRepository(env: event.env);
        DataResponse response =
            await homeRepository.getWeatherData(city: event.city);
        if (response.status == Status.Success) {
          Weather weather = Weather.getWeatherFromMap(response.data);
          DataResponse response1 =
              await homeRepository.getCurrentWeatherData(city: event.city);
          if (response1.status == Status.Success) {
            CurrentWeather currentWeather =
                CurrentWeather.getWeatherFromMap(response1.data);
            emit(WeatherDataGot(
                weather: weather, currentWeather: currentWeather));
          } else {
            emit(WeatherDataGetFailed(error: response1.message));
          }
        } else {
          emit(WeatherDataGetFailed(error: response.message));
        }
      } catch (ex, stack) {
        debugPrintStack(stackTrace: stack, label: ex.toString());
        emit(WeatherDataGetFailed(error: ex.toString()));
      }
    });

    on<FilterWeatherData>((event, emit) async {
      emit(WeatherDataFiltering());
      try {
        List<WeatherData> filteredWeather = [];
        int prev = 0;
        await event.weather.weatherData.forEach((element) {
          if (DateTime.now()
                  .difference(DateTime.fromMillisecondsSinceEpoch(
                      (int.parse(element.date)) * 1000))
                  .inDays !=
              prev) {
            filteredWeather.add(element);
            prev = DateTime.now()
                .difference(DateTime.fromMillisecondsSinceEpoch(
                    (int.parse(element.date)) * 1000))
                .inDays;
            print("prev: $prev");
          }
        });
        emit(WeatherDataFiltered(filteredWeatherData: filteredWeather));
      } catch (ex) {
        emit(WeatherDataFilterFailed(error: ex.toString()));
      }
    });
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    this.add(OnHomeVoiceOverFetched(data: result.recognizedWords));
  }

  void _onSpeechListening(String result) {
    this.add(OnHomeVoiceOverListening());
  }
}
