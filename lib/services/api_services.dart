import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

class APIServices extends GetxService {
  dio.Dio _dio = dio.Dio();

  APIServices() {
    _basicDioConfiguraion();
  }

  void _basicDioConfiguraion() {
    _dio.options.baseUrl = "http://45.77.142.182:8000/api/";
    _dio.options.connectTimeout = Duration(seconds: 30);
    _dio.options.receiveTimeout = Duration(seconds: 1000);
    // _dio.interceptors
    //     .add(dio.InterceptorsWrapper(onRequest: (options, handler) {
    //   // print('Request: ${options.method} ${options.path}');
    //   // print('Request_Data_interceptor: ${options.data}');
    //   // handler.next(options);
    //   // print('from_interceptor_the_option_is $options');
    // }, onError: (dio.DioException e, handler) {
    //   print('Error_from_interceptor: ${e.response?.statusCode}');
    //   print('Error_from_interceptor: ${e.response?.data}');
    //   handler.next(e); //
    // }, onResponse: (response, handler) {
    //   print('Response_from_interceptor: ${response.data}');
    //   handler.next(response); // c
    // }));
  }

  Future<dio.Response> postRequest(String url, var payload) async {
    try {
      print("Post request being made");
      final response = await _dio.post(url,
          data: payload,
          options: dio.Options(contentType: dio.Headers.jsonContentType));
      return response;
    } on dio.DioException catch (e) {
      if (e.response != null) {
        // print("Error status: ${e.response?.statusCode}");
        // print("Error response: ${e.response?.data}");
        return e.response!;
      } else {
        print("Error without response: $e");
        throw Exception('DioException without response: $e');
      }
    } catch (e) {
      print("Unexpected errorat post: $e");
      throw Exception('unexpected error from the post method :$e');
    }
  }

  Future<dio.Response> getRequest(String url, var payload) async {
    try {
      final response = await _dio.get(url,
          data: payload,
          options: dio.Options(contentType: dio.Headers.jsonContentType));
      return response;
    } on dio.DioException catch (e) {
      throw Exception('Exception from post method in http_service $e');
    }
  }
}
