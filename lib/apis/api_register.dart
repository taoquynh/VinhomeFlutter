import 'package:dio/dio.dart';
import 'package:vinhome/apis/manages.dart';
import 'package:vinhome/apis/names.dart';
import 'package:vinhome/commons/consts/secure_storage.dart';
import 'package:vinhome/models/user.dart';

import 'method.dart';

void register(
    String phone,
    String password,
    String name,
    String email,
    Function(dynamic) onSuccess,
    Function(String) onFailure,
    Function(dynamic) onErrorHttp) async {
  final formData = FormData.fromMap({
    'PhoneNumber': phone,
    'Password': password,
    'Name': name,
    'Email': email,
    'Address': '',
  });

  User user;

  ApiManager().request(ApiName().login, Method.post, formData, (data) async {
    user = User.fromJSON(data);
    await storage.write(key: loginStorage, value: user.token);
    onSuccess(data);
  }, (messageE) => onFailure(messageE), (e) => onErrorHttp(e));
}
