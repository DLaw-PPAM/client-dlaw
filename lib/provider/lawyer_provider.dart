import 'dart:io';

import 'package:client_dlaw/data/api/api_services.dart';
import 'package:client_dlaw/data/response/responses.dart';
import 'package:client_dlaw/utils/result_state.dart';
import 'package:flutter/material.dart';

class LawyersProvider extends ChangeNotifier {
  final ApiServices apiService;

  LawyersProvider({required this.apiService}) {
    _fetchAllArticle();
  }

  late LawyersResult _articlesResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  LawyersResult get result => _articlesResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllArticle() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final lawyers = await apiService.getLawyers();
      if (lawyers.lawyers.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _articlesResult = lawyers;
      }
    } on SocketException {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'No Connection';
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = e.toString();
    }
  }
}
