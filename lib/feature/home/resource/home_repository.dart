import 'package:meta/meta.dart';

import '../../../common/constant/env.dart';
import '../../../common/http/api_provider.dart';
import '../../../common/util/internet_check.dart';
import 'home_api_provider.dart';

class HomeRepository {
  ApiProvider apiProvider;
  HomeApiProvider homeApiProvider;
  InternetCheck internetCheck;
  Env env;

  HomeRepository(
      {@required this.env,
      @required this.apiProvider,
      @required this.internetCheck}) {
    homeApiProvider =
        HomeApiProvider(baseUrl: env.baseUrl, apiProvider: apiProvider);
  }
}
