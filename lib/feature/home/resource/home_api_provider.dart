import 'dart:async';

import 'package:meta/meta.dart';

import '../../../common/http/api_provider.dart';

class HomeApiProvider {
  final ApiProvider apiProvider;
  final String baseUrl;
  HomeApiProvider({@required this.baseUrl, @required this.apiProvider});
}
