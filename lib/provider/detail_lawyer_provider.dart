import 'dart:io';

import 'package:client_dlaw/data/api/api_services.dart';
import 'package:client_dlaw/data/response/responses.dart';
import 'package:client_dlaw/utils/result_state.dart';
import 'package:flutter/material.dart';

class DetailLawyerProvider extends ChangeNotifier {
  final ApiServices apiServices;
  final String id;

  DetailLawyerProvider({required this.apiServices, required this.id}) {
    _fetchDetailLawyer(id);
  }

  late DetailLawyerResult _detailLResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  DetailLawyerResult get result => _detailLResult;

  ResultState get state => _state;

  Future<dynamic> _fetchDetailLawyer(id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final response = await apiServices.getDetailLawyer(id);
      if (response.error) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _detailLResult = response;
      }
    } on SocketException {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'No Connection';
    } catch (e) {
      _state = ResultState.error;
      // notifyListeners();
      return _message = e.toString();
    }
  }

  Future<dynamic> postReview({
    required String lawyerId,
    required String userId,
    required String clientName,
    required int rating,
    required String description,
  }) async {
    try {
      final response = await apiServices.postReview(
        lawyerId: lawyerId,
        userId: userId,
        clientName: clientName,
        rating: rating,
        description: description,
      );
      if (response.error) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _message = response.message;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = e.toString();
    }
  }
}
