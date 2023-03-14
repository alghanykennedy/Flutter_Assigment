import 'package:bankbapakmu/app/data/home_service.dart';
import 'package:bankbapakmu/app/domain/home_model.dart';

class HomeRepository {
  final HomeService _homeService;

  HomeRepository({required HomeService homeService})
      : _homeService = homeService;

  Future<HomeModel> getHomes() async {
    try {
      var response = await _homeService.getHomes();
      HomeModel homes = response;
      return homes;
    } catch (e) {
      rethrow;
    }
  }
}
