import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/bloc/connectivity/index.dart';
import 'package:weather_app/common/constant/env.dart';
import 'package:weather_app/common/http/api_provider.dart';
import 'package:weather_app/common/route/route_generator.dart';
import 'package:weather_app/common/route/routes.dart';
import 'package:weather_app/common/util/internet_check.dart';
import 'package:weather_app/feature/authentication/bloc/index.dart';
import 'package:weather_app/feature/authentication/resource/user_repository.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'theme.dart';

class App extends StatelessWidget {
  final Env env;

  App({Key key, @required this.env}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Env>(
          create: (context) => env,
          lazy: true,
        ),
        RepositoryProvider<InternetCheck>(
          create: (context) => InternetCheck(),
          lazy: true,
        ),
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepository(),
          lazy: true,
        ),
        RepositoryProvider<ApiProvider>(
          create: (context) => ApiProvider(),
          lazy: true,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ConnectivityBloc>(
            create: (context) {
              return ConnectivityBloc();
            },
          ),
          BlocProvider<AuthenticationBloc>(
            create: (context) {
              return AuthenticationBloc(
                  userRepository:
                      RepositoryProvider.of<UserRepository>(context))
                ..add(AuthStarted());
            },
          ),
        ],
        child: MaterialApp(
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          title: 'Weather App',
          theme: basicTheme,
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: Routes.landing,
        ),
      ),
    );
  }
}
