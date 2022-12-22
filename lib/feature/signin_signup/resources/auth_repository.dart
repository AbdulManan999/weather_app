import 'package:weather_app/common/constant/env.dart';
import 'package:weather_app/common/http/api_provider.dart';
import 'package:weather_app/common/http/response.dart';
import 'package:weather_app/common/util/internet_check.dart';
import 'package:meta/meta.dart';

import 'auth_api_provider.dart';

class AuthRepository {
  final ApiProvider apiProvider;
  AuthApiProvider authApiProvider;
  InternetCheck internetCheck;
  Env env;

  AuthRepository(
      {@required this.env,
      @required this.apiProvider,
      @required this.internetCheck}) {
    authApiProvider =
        AuthApiProvider(baseUrl: env.baseUrl, apiProvider: apiProvider);
  }

  Future<DataResponse<dynamic>> signIn(String email, String password) async {
    final response = await authApiProvider.signIn(email, password);

    DataResponse dataResponse = DataResponse.processResponse(response);

    if (dataResponse.data != null) {
      dataResponse.data = dataResponse.data["token_value"];
    }
    print(dataResponse.runtimeType);
    return dataResponse;
  }

  Future<Map<String, dynamic>> signUp(
      String email, String password, String name) {
    return authApiProvider.signUp(email, password, name);
  }
}
