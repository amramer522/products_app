import 'package:dio/dio.dart';

class DioHelper {
  final dio = Dio(
    BaseOptions(
      baseUrl: "http://store.webautobazaar.com/api/",
    ),
  );

  getData({required String endPoint}) {
    dio.get(endPoint);
  }

  sendData({required String endPoint, FormData? data}) {
    dio.post(endPoint, data: data).then((value) {
      print(value);
    });
  }
}
