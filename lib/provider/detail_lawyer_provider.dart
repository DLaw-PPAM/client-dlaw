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

  late DetailLawyerResult _detailRestaurantResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  DetailLawyerResult get result => _detailRestaurantResult;

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
        return _detailRestaurantResult = response;
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

  Future<dynamic> postReview({
    required int lawyerId,
    required int userId,
    required double rating,
    required String description,
  }) async {
    try {
      final response = await apiServices.postReview(
        lawyerId: lawyerId,
        userId: userId,
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
