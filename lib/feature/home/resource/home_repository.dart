import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/common/http/response.dart';

import '../../../common/constant/env.dart';
import 'home_api_provider.dart';

class HomeRepository {
  Env env;

  HomeRepository({@required this.env});

  Future<DataResponse<Map<String, dynamic>>> getWeatherData(
      {String city}) async {
    try {
      HomeApiProvider homeApiProvider = HomeApiProvider(env: env);
      Map<String, dynamic> response =
          await homeApiProvider.getWeatherData(city: city);
      DataResponse<Map<String, dynamic>> dataResponse =
          DataResponse.processResponse(response);
      return dataResponse;
    } catch (ex, stack) {
      debugPrintStack(stackTrace: stack, label: ex.toString());
      return DataResponse.error(ex.toString());
    }
  }

  Future<DataResponse<Map<String, dynamic>>> getCurrentWeatherData(
      {String city}) async {
    try {
      HomeApiProvider homeApiProvider = HomeApiProvider(env: env);
      Map<String, dynamic> response =
          await homeApiProvider.getCurrentWeatherData(city: city);
      DataResponse<Map<String, dynamic>> dataResponse =
          DataResponse.processResponse(response);
      return dataResponse;
    } catch (ex, stack) {
      debugPrintStack(stackTrace: stack, label: ex.toString());
      return DataResponse.error(ex.toString());
    }
  }
}
