import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../resource/user_repository.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null),
        super(AuthenticationUninitialized()) {
    on<AuthStarted>((event, emit) async {
      await Future.delayed(Duration(seconds: 5));
      final bool hasToken = await userRepository.hasToken();

      if (hasToken) {
        emit(AuthenticationAuthenticated());
      } else {
        emit(AuthenticationUnauthenticated());
      }
    });

    on<LoggedIn>((event, emit) async {
      emit(AuthenticationLoading());
      await userRepository.persistToken(event.token);
      emit(AuthenticationAuthenticated());
    });

    on<LoggedOut>((event, emit) async {
      emit(AuthenticationLoading());
      await userRepository.deleteToken();
      emit(AuthenticationUnauthenticated());
    });
  }
}
