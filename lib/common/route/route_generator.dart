import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/feature/home/ui/screens/home_details.dart';

import '../../feature/landing/landing_page.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.landing:
        return MaterialPageRoute<dynamic>(builder: (_) => LandingPage());

      case Routes.homeDetails:
        return MaterialPageRoute<dynamic>(
            builder: (_) => HomeDetails(
                  data: args,
                ));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
