import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:select_one/entity/restaurant_entity.dart';
import 'package:select_one/entity/user_entity.dart';
import 'package:select_one/service/api/dio_client.dart';

class CommonService with ChangeNotifier {
  final DioClient _dioClient = DioClient(); // 使用 DioClient 实例
  bool _isLoading = false;
  String _errorMessage = '';
  List<dynamic> _datas = [];

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  List<dynamic> get datas => _datas;

  Future<void> loadDatas() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners(); // 通知UI更新

    try {
      final response = await _dioClient.get('/datas');
      // define by dynamoDB
      final jsonResponse = json.decode(response.data) as Map<String, dynamic>;
      final result = jsonResponse['data'] as List;
      _datas = result.map((json) => Restaurant.fromJson(json)).toList();
      var a = User.fromJson("json" as Map<String, dynamic>);

      User(username: 'asd').toJson();
    } catch (e) {
      _errorMessage = e.toString();
      print(_errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners(); // 通知UI更新
    }
  }
}
