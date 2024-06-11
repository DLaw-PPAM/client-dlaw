import 'dart:io';

import 'package:client_dlaw/data/api/api_services.dart';
import 'package:client_dlaw/data/response/responses.dart';
import 'package:client_dlaw/utils/result_state.dart';
import 'package:flutter/material.dart';

class DetailCaseProvider extends ChangeNotifier {
  final ApiServices apiServices;
  final String id;

  DetailCaseProvider({required this.apiServices, required this.id}) {
    _fetchDetailCase(id);
  }

  late DetailCaseResult _detailCaseResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  DetailCaseResult get result => _detailCaseResult;

  ResultState get state => _state;

  Future<dynamic> _fetchDetailCase(id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final response = await apiServices.getDetailCase(id);
      if (response.error) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _detailCaseResult = response;
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

  Future<dynamic> _fetchReviewsByLawyerId(caseId) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final response = await apiServices.getReviewsByLawyerId(caseId);
      if (response.error) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _message = response.message;
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
