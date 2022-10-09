import 'dart:convert';

import 'package:dio/dio.dart';

class DioHelper {
  final dio = Dio(
    BaseOptions(
      baseUrl: "http://store.webautobazaar.com/api/",
      receiveDataWhenStatusError: true,
      contentType:
          "multipart/form-data; boundary=<calculated when request is sent>",
      headers: {
        "token":"CacheHelper.getUserToken()",
      }
    ),
  );

  Future<Response<dynamic>> getData({required String endPoint}) {
    return dio.get(endPoint);
  }

  Future<CustomResonse> sendData(
      {required String endPoint, FormData? data}) async {
    try {
      var resp = await dio.post(endPoint, data: data);
      final response = json.decode(resp.toString());
      print(response.toString());
      return CustomResonse(msg: response["msg"], isSuccess: response["status"]);
    } on DioError catch (e) {
      if (e.response != null) {
        final resp = json.decode(e.response.toString());
        print(resp.toString());
        return CustomResonse(msg: resp["msg"], isSuccess: resp["status"]);
      } else {
        return CustomResonse(msg: "Server Error", isSuccess: false);
      }
    }
  }
}

class CustomResonse {
  final String msg;
  final bool isSuccess;

  CustomResonse({required this.msg, required this.isSuccess});
}
