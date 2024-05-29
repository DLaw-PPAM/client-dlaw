import 'dart:io';

import 'package:client_dlaw/data/api/api_services.dart';
import 'package:client_dlaw/data/response/responses.dart';
import 'package:client_dlaw/utils/result_state.dart';
import 'package:flutter/material.dart';

class DetailLawyerProvider extends ChangeNotifier {
  final ApiServices apiServices;
  final String id;

  DetailLawyerProvider({required this.apiServices, required this.id}) {
    _fetchDetailRestaurant(id);
  }

  late DetailLawyerResult _detailRestaurantResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  DetailLawyerResult get result => _detailRestaurantResult;

  ResultState get state => _state;

  Future<dynamic> _fetchDetailRestaurant(id) async {
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
}
