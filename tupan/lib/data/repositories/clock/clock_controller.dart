import 'package:dio/dio.dart';
import 'package:tupan/data/repositories/base_controller.dart';
import 'package:tupan/utils/constants.dart';

class ClockController extends BaseController {
  // Dio dio = Dio();

  Future<dynamic> getlastClockByUserId(String id) async {
    print(Credentials.token);
    try {
      final response = dio.get(
        "/clock/$id",
        options: Options(
          headers: {
            'Authorization': 'Bearer ${Credentials.token!}',
          },
        ),
      );
      return response;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
