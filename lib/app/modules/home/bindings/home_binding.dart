import 'package:bankbapakmu/app/data/home_service.dart';
import 'package:bankbapakmu/app/modules/home/repository/home_repository.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
          homeRepository: HomeRepository(homeService: HomeService())),
    );
  }
}
