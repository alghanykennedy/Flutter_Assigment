import 'package:bankbapakmu/app/data/home_service.dart';
import 'package:bankbapakmu/app/domain/home_model.dart';
import 'package:bankbapakmu/app/modules/home/repository/home_repository.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository;

  HomeController({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;

  RxBool isLoading = false.obs;
  RxList<Datum> homes = <Datum>[].obs;
  HomeService homeService = HomeService();
  RxList<Item> products = <Item>[].obs;
  RxList<Item> articles = <Item>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getHomes();
    // _launchUrl();
    // Logger().d(getHomes());
  }

  Future<void> getHomes() async {
    isLoading(true);
    try {
      var response = await _homeRepository.getHomes();
      final res = response.data!;
      homes.addAll(res);
      products.addAll(res[1].items!);
      articles.addAll(res[0].items!);

      isLoading(false);
    } catch (e) {
      isLoading(false);
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> openUrl(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
