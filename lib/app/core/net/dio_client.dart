import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;
  ApiClient(String baseUrl)
      : dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 20),
          ),
        ) {
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: false,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      error: true,
      logPrint: (obj) => _safePrint(obj),
    ));
  }
}

void _safePrint(Object? obj) {
  // ignore: avoid_print
  print(obj);
}

