

import 'package:crud_example/config/contants.dart';
import 'package:crud_example/utils/import.dart';

class AuthReps {
  final Dio dio = Dio();
  final box = GetStorage();
  Future<void> login({required String login, required String password}) async{
    final Response response = await dio.post("${ApiConstants.baseUrl}/user/login/", data: {
      "phone": login,
      "password": password
    });

    box.write(Config.token, response.data["access"]);
    box.write(Config.refreshToken, response.data["refresh"]);
    print("token saved");


  }
}