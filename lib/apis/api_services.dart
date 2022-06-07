import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String domain = 'http://report.bekhoe.vn';

  static final ApiService _apiService = ApiService._internal();
  factory ApiService() => _apiService;
  ApiService._internal();

  String token = '';

  Future<dynamic> request({
    required String path,
    required Method method,
    Map<String, dynamic>? parameters,
  }) async {
    final accessToken = 'Bearer $token';

    final header = {
      'Authorization': accessToken,
    };

    parameters ??= {};

    if (kDebugMode) {
      print(domain + path);
    }

    try {
      http.Response response;
      final url = Uri.parse(domain + path);
      switch (method) {
        case Method.get:
          response = await http.get(url, headers: header);
          break;
        case Method.post:
          response = await http.post(url,
              headers: header, body: parameters, encoding: utf8);
          break;
        case Method.put:
          response = await http.put(url,
              headers: header, body: parameters, encoding: utf8);
          break;
        case Method.delete:
          response = await http.delete(url, headers: header);
          break;
        default:
          response = await http.get(url, headers: header);
          break;
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {}
    } catch (e) {
      if (kDebugMode) {
        print('$path \n$e');
      }
    }
  }
}

enum Method { get, post, put, delete }

extension MethodExtension on Method {
  String get text {
    switch (this) {
      case Method.get:
        return 'GET';
      case Method.post:
        return 'POST';
      case Method.put:
        return 'PUT';
      case Method.delete:
        return 'DELETE';
    }
  }
}
