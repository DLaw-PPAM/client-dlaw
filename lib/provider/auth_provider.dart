import 'package:client_dlaw/data/api/api_services.dart';
import 'package:client_dlaw/data/db/auth_repository.dart';
import 'package:client_dlaw/data/response/login_result.dart';
import 'package:client_dlaw/data/response/register_result.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final ApiServices apiService;

  AuthProvider(this.apiService, this.authRepository);

  final AuthRepository authRepository;
  bool isLoadingLogout = false;
  bool isLoggedIn = false;
  bool isRegistered = false;

  String message = '';

  RegisterResult? registerResult;
  LoginResult? loginResponse;

  Future register(String fullname, String email, String password, DateTime birthdate, String username) async {
    try {
      message = '';
      registerResult = null;
      isRegistered = true;
      notifyListeners();

      registerResult = await apiService.register(fullname, email, password, birthdate, username);

      message = registerResult?.message ?? 'User Created';
      isRegistered = false;
      notifyListeners();
    } catch (e) {
      isRegistered = false;
      message = e.toString();
      notifyListeners();
    }
  }

  Future login(String email, String password) async {
    try {
      message = '';
      loginResponse = null;
      isLoggedIn = true;
      notifyListeners();

      loginResponse = await apiService.login(email, password);

      message = loginResponse?.message ?? 'success';
      isLoggedIn = false;
      notifyListeners();
    } catch (e) {
      isLoggedIn = false;
      message = e.toString();
      notifyListeners();
    }
  }

  Future<bool> logout() async {
    isLoadingLogout = true;
    notifyListeners();
    final logout = await authRepository.logout();
    if (logout) {
      await authRepository.deleteUser();
    }
    isLoggedIn = await authRepository.isLoggedIn();
    isLoadingLogout = false;
    notifyListeners();
    return !isLoggedIn;
  }
}