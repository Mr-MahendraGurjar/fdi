import 'dart:async';
import 'dart:convert';
import 'package:FdisTesting/models/login_model.dart';
import 'package:FdisTesting/utils/api.dart';
import 'package:FdisTesting/utils/shared_prefs.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LoginState {
  initial,
  loading,
  success,
  error,
}

class LoginProvider with ChangeNotifier {
  LoginState _loginState = LoginState.initial;
  String loginErrorMessage = "";
  final api = Api();
  LoginModel loginModel = LoginModel();

  LoginState get loginState => _loginState;

  String get errorMessage => loginErrorMessage;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  void setLoginState(LoginState state) {
    _loginState = state;
    notifyListeners();
  }

  Future<bool> login({
    required String username,
    required String password,
    required void Function(LoginState state) onLoginStateChanged,
  }) async {
    setLoginState(LoginState.loading);
    setLoading(true);
    try {
      final response = await api.post(
        endpoint: 'api/v1/dashboard/Mob/login',
        body: {'username': username.trim(), 'password': password.trim()},
      );
      final item = response.data;
      if (response.statusCode == 200) {
        loginModel = LoginModel.fromJson(item);
        SharedPrefs.saveToken(loginModel.data?.token ?? "");
        SharedPrefs.saveUserId(loginModel.data?.userId ?? "");
        SharedPrefs.saveIsLoggedIn(true);
        _loginState = LoginState.success;
        setLoading(false);
        notifyListeners();

        if (onLoginStateChanged != null) {
          onLoginStateChanged(LoginState.success);
        }

        return true;
      } else {
        loginErrorMessage = 'Login failed';
        setLoading(false);
        _loginState = LoginState.error;
        notifyListeners();

        if (onLoginStateChanged != null) {
          onLoginStateChanged(LoginState.error);
        }

        return false;
      }
    } catch (error) {
      loginErrorMessage = error.toString();
      setLoading(false);
      _loginState = LoginState.error;
      debugPrint(error.toString());
      notifyListeners();
      if (onLoginStateChanged != null) {
        onLoginStateChanged(LoginState.error);
      }
      return false;
    }
  }
}
