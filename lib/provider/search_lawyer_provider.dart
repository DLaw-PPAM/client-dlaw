import 'dart:io';

import 'package:client_dlaw/data/api/api_services.dart';
import 'package:client_dlaw/data/response/responses.dart';
import 'package:client_dlaw/utils/result_state.dart';
import 'package:flutter/material.dart';

class SearchLawyersProvider extends ChangeNotifier {
  final ApiServices apiService;

  SearchLawyersProvider({
    required this.apiService,
  }) {
    searchLawyers(query);
  }

  late SearchLawyersResult _lawyersResult;
  late ResultState _state;
  String _message = '';
  String _query = '';

  String get message => _message;

  String get query => _query;

  SearchLawyersResult get result => _lawyersResult;

  ResultState get state => _state;

  Future<dynamic> searchLawyers(String keyword) async {
    try {
      _state = ResultState.loading;
      _query = keyword;
      notifyListeners();

      if (keyword.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      }

      final lawyer = await apiService.getLawyersByKeyword(keyword);
      if (lawyer.lawyers.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _lawyersResult = lawyer;
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
