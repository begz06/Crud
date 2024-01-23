import 'package:crud_example/config/contants.dart';

import '../../utils/import.dart';

class BoardRepo {
  final Dio dio = Dio();
  final GetStorage box = GetStorage();

  Future<List<Board>> getBoards() async {
    try{
      final Response response = await dio.get("${ApiConstants.baseUrl}/board/",
          options: Options(
              headers: {"Authorization": "Bearer ${box.read(Config.token)}"}));
      final List<Board> boardsList = (response.data as List<dynamic>).map((e) => Board.fromJson(e)).toList();
      return boardsList;
    } catch(e){
      print(e);
      rethrow;
    }

  }
}
