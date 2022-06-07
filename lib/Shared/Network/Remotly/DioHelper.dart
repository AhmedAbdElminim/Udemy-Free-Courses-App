import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://sumanjay.vercel.app/udemy',
        receiveDataWhenStatusError: true));
  }

  static Future<Response> GetData() async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'access-control-allow-origin': '*',
      'server': 'Vercel',
      'x-vercel-cache': 'BYPASS',
      'x-vercel-id': 'cdg1::iad1::8tm64-1651740993308-dafd8a29277e',
      'cache-control': 'public, max-age=0, must-revalidate'
    };
    return await dio!.get('https://sumanjay.vercel.app/udemy');
  }
}
