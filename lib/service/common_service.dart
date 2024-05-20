import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:select_one/entity/restaurant_entity.dart';
import 'package:select_one/entity/user_entity.dart';
import 'package:select_one/service/api/dio_client.dart';

class CommonService with ChangeNotifier {
  final DioClient _dioClient = DioClient();
  bool _isLoading = false;
  String _errorMessage = '';
  List<dynamic> _dataList = [];

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  List<dynamic> get dataList => _dataList;

  Future<void> loadDatas() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final response = await _dioClient.get('/dataList');
      // define by dynamoDB
      final jsonResponse = json.decode(response.data) as Map<String, dynamic>;
      final result = jsonResponse['data'] as List;
      _dataList = result.map((json) => Restaurant.fromJson(json)).toList();
      var a = User.fromJson("json" as Map<String, dynamic>);

      const User(username: 'username').toJson();
    } catch (e) {
      _errorMessage = e.toString();
      if (kDebugMode) {
        print(_errorMessage);
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
