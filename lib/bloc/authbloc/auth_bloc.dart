
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos/data/repositpry/user_repo.dart';
import 'package:todos/domain/models/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;
  AuthBloc({required this.userRepository}) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 3));
      try {
        User? user = await userRepository.loginUser(
          {
            'email': event.email,
            'password': event.password,
          },
        );
        if (user != null) {
          emit(
            AuthSuccess(
              user: user,
              message: 'Signed in successfully',
            ),
          );
        } else {
          emit(
            AuthSuccess(
              user: null,
              message: 'User not found',
            ),
          );
        }
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });
  }
}
