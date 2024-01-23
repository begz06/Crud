

import '../../utils/import.dart';

class DioClient{
  final Dio dio = Dio();

  DioClient(){
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (requestHeader, handler){

      }
    ));
  }
}