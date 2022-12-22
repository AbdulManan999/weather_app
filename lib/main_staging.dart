import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/app.dart';
import 'package:weather_app/common/bloc/simple_bloc_delegate.dart';
import 'package:weather_app/common/constant/env.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(
    () {
      runApp(App(env: EnvValue.staging));
    },
    blocObserver: SimpleBlocDelegate(),
  );
}
