import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:weather_app/feature/authentication/bloc/index.dart';
import 'package:weather_app/feature/signin_signup/bloc/index.dart';
import 'package:weather_app/feature/signin_signup/resources/auth_repository.dart';
import 'package:meta/meta.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepository;
  final AuthenticationBloc authenticationBloc;

  SignUpBloc({
    @required this.authRepository,
    @required this.authenticationBloc,
  })  : assert(authRepository != null),
        assert(authenticationBloc != null),
        super(SignUpInitial()) {
    on<SignUpButtonPressed>((event, emit) async {
      emit(SignUpLoading());

      try {
        final response = await authRepository.signUp(
            event.email, event.username, event.password);
        if (!response['error']) {
          emit(SignUpSuccess());
          authenticationBloc.add(LoggedIn(token: response["token"]));
        } else {
          emit(SignUpInitial());
        }
      } catch (error) {
        emit(SignUpFailure(error: error.toString()));
      }
    });
  }
}
