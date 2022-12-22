import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:weather_app/common/http/response.dart';
import 'package:weather_app/feature/authentication/bloc/index.dart';
import 'package:weather_app/feature/signin_signup/bloc/index.dart';
import 'package:weather_app/feature/signin_signup/resources/auth_repository.dart';
import 'package:meta/meta.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository authRepository;
  final AuthenticationBloc authenticationBloc;

  SignInBloc({
    @required this.authRepository,
    @required this.authenticationBloc,
  })  : assert(authRepository != null),
        assert(authenticationBloc != null),
        super(SignInInitial()) {
    on<SignInButtonPressed>((event, emit) async {
      emit(SignInLoading());

      try {
        DataResponse<dynamic> response =
            await authRepository.signIn(event.email, event.password);
        print("response: $response");
        if (response.status == Status.ConnectivityError) {
          //Internet problem
          emit(const SignInFailure(error: ""));
        }
        if (response.status == Status.Success) {
          print("response.data: ${response.data}");
          authenticationBloc.add(LoggedIn(token: response.data));
          emit(SignInSuccess());
        } else {
          emit(SignInFailure(error: response.message));
        }
      } catch (error) {
        emit(SignInFailure(error: error.toString()));
      }
    });
  }
}
