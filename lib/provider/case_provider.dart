import 'dart:io';

import 'package:client_dlaw/data/api/api_services.dart';
import 'package:client_dlaw/data/response/responses.dart';
import 'package:client_dlaw/utils/result_state.dart';
import 'package:flutter/material.dart';

class CasesProvider extends ChangeNotifier {
  final ApiServices apiService;
  final String id;

  CasesProvider({
    required this.apiService,
    required this.id,
  }) {
    _fetchCasesByUserId(id);
  }

  late CasesResult _articlesResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  CasesResult get result => _articlesResult;

  ResultState get state => _state;

  Future<dynamic> _fetchCasesByUserId(id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final cases = await apiService.getCasesByUserId(id);
      if (cases.cases.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _articlesResult = cases;
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
