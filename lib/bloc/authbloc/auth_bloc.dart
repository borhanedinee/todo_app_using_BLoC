import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos/data/network/google_login_api.dart';
import 'package:todos/data/repositpry/user_repo.dart';
import 'package:todos/domain/models/user.dart';
import 'package:todos/main.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;
  AuthBloc({required this.userRepository}) : super(AuthInitial()) {
    on<LoginEvent>(signIn);
    on<GoogleLoginEvent>(signInWithGoogle);
  }

  FutureOr<void> signIn(event, emit) async {
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
  }

  FutureOr<void> signInWithGoogle(event, emit) async {
    emit(GoogleLoginLoading());
    try {
      // await GoogleLogin.clear();
      var userFromGoogle = await GoogleLogin.login();
     
      if (userFromGoogle != null) {
         print(userFromGoogle.email);
        //TODO HANDLE USER PASSWORD OF GOOGLE USER SIGNING IN
        User? user = await userRepository.addUser({
          'username': userFromGoogle.displayName,
          'useremail':userFromGoogle.email,
          'useravatar': userFromGoogle.photoUrl,
          'userpassword' : userFromGoogle.id
        });
        if (user != null) {
          emit(GoogleLoginSuccess(
              user: user, message: 'Signed in successfully'));
        } else {
          emit(GoogleLoginFailed(
              message: 'Something went wrong, please try again'));
        }
      } else {
        emit(GoogleLoginFailed(
            message: 'Something went wrong, please try again'));
      }
    } catch (e) {
      print(e.toString());
      logger.e(e.toString());
      emit(
          GoogleLoginFailed(message: 'Something went wrong, please try again'));
    }
  }
}
