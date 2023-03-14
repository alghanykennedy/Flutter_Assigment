import 'package:bankbapakmu/app/domain/home_model.dart';
import 'package:get/get.dart';

class HomeService {
  final _connect = Get.find<GetConnect>();

  Future<HomeModel> getHomes() async {
    final response = await _connect.get('home',
        decoder: (data) => HomeModel.fromJson(data as Map<String, dynamic>));
    if (!response.hasError) {
      return response.body!;
    } else {
      throw Get.snackbar('Error', response.statusCode.toString());
    }
  }
}
