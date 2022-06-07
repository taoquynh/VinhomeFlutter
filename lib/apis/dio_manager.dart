import 'package:dio/dio.dart';

class DioManager {
  Dio dio = Dio();
  final String domain = 'http://report.bekhoe.vn';

  final dioManager = DioManager();
  Future<void> request(
      {required String path,
      required Method method,
      Map<String, dynamic>? parameters,
      required Function(dynamic) onSuccess,
      required Function(dynamic) onFailure,
      required Function(dynamic) onErrorHttp}) async {
    parameters ??= {};

    String token = '';

    final accessToken = 'Bearer $token';

    final headers = {
      'Authorization': accessToken,
    };

    print(parameters);
    // final formData = FormData.fromMap(parameters);
    // print(formData);
    // try {
    //   Response response;
    //   switch (method) {
    //     case Method.get:
    //       response = await dio.get(
    //         domain + path,
    //         queryParameters: parameters,
    //         options: Options(headers: headers),
    //       );
    //       break;
    //     case Method.post:
    //       response = await dio.post(
    //         domain + path,
    //         data: formData,
    //         options: Options(headers: headers),
    //       );
    //
    //       if (kDebugMode) {
    //         print('response $response');
    //       }
    //       break;
    //     case Method.put:
    //       response = await dio.put(
    //         domain + path,
    //         data: parameters,
    //         options: Options(headers: headers),
    //       );
    //       break;
    //     case Method.delete:
    //       response = await dio.delete(
    //         domain + path,
    //         data: parameters,
    //         options: Options(headers: headers),
    //       );
    //       break;
    //     default:
    //       break;
    //   }
    //
    //   // if (response.statusCode >= 200 && response.statusCode < 300) {
    //   //   if (response.data['code'] == 0) {
    //   //     onSuccess(response.data['data']);
    //   //   } else {
    //   //     onFailure(response.data['message']);
    //   //   }
    //   // } else {
    //   //   onErrorHttp(response.statusMessage);
    //   // }
    // } on DioError catch (e) {
    //   onErrorHttp(e.message);
    // } catch (e) {
    //   onErrorHttp(e);
    // }
  }
}

enum Method { get, post, put, delete }
