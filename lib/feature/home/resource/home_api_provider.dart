import 'dart:async';

import 'package:meta/meta.dart';

import '../../../common/constant/env.dart';
import '../../../common/http/api_provider.dart';

class HomeApiProvider {
  final Env env;
  HomeApiProvider({@required this.env});

  Future<Map<String, dynamic>> getWeatherData({String city}) async {
    try {
      ApiProvider apiProvider = ApiProvider();
      Map<String, dynamic> response = await apiProvider.get(env.baseUrl +
          "forecast?q=${city}&units=metric&appid=6a50198e5bb764f715187efd819d883d");
      return response;
    } on Error catch (e) {
      print("Response: ${e.toString()}");
      throw Exception('Failed to load Get ' + e.toString());
    }
  }

  Future<Map<String, dynamic>> getCurrentWeatherData({String city}) async {
    try {
      ApiProvider apiProvider = ApiProvider();
      Map<String, dynamic> response = await apiProvider.get(env.baseUrl +
          "weather?q=${city}&units=metric&appid=6a50198e5bb764f715187efd819d883d");
      return response;
    } on Error catch (e) {
      print("Response: ${e.toString()}");
      throw Exception('Failed to load Get ' + e.toString());
    }
  }
}
