import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';


class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitial()) {
    debugPrint('AuthCubit initialized');
    _loadStoredUser();
  }

  String? _storedEmail;
  String? _storedPassword;

  Future<void> _loadStoredUser() async {
    debugPrint('Loading stored user (fake implementation)');
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      emit(const AuthLoading());

      // Validation
      if (password != confirmPassword) {
        emit(const AuthUnauthenticated(error: 'Passwords do not match'));
        return;
      }

      if (password.length < 6) {
        emit(const AuthUnauthenticated(
            error: 'Password must be at least 6 characters'));
        return;
      }

      await Future.delayed(const Duration(seconds: 1));

      _storedEmail = email;
      _storedPassword = password;

      emit(AuthAuthenticated(email));
    } catch (e, stackTrace) {
      emit(AuthUnauthenticated(error: 'Sign up failed. Please try again.'));
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      emit(const AuthLoading());

      await Future.delayed(const Duration(milliseconds: 800));

      if (_storedEmail == null || _storedPassword == null) {
        emit(const AuthUnauthenticated(
            error: 'No account found. Please sign up first.'));
        return;
      }

      if (email == _storedEmail && password == _storedPassword) {
        emit(AuthAuthenticated(email));
        debugPrint('User logged in: $email');
      } else {
        emit(const AuthUnauthenticated(error: 'Invalid email or password'));
      }
    } catch (e, stackTrace) {
      debugPrint('Login error: $e\n$stackTrace');
      emit(AuthUnauthenticated(error: 'Login failed. Please try again.'));
    }
  }

  Future<void> logout() async {
    try {
      emit(const AuthLoading());
      await Future.delayed(const Duration(milliseconds: 300));
      emit(const AuthUnauthenticated());
      debugPrint('User logged out');
    } catch (e, stackTrace) {
      debugPrint('Logout error: $e\n$stackTrace');
      emit(AuthUnauthenticated(error: 'Logout failed. Please try again.'));
    }
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    debugPrint('State changed from ${change.currentState} to ${change.nextState}');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    debugPrint('AuthCubit error: $error\n$stackTrace');
    super.onError(error, stackTrace);
  }
}