import 'package:bankbapakmu/app/data/home_service.dart';
import 'package:bankbapakmu/app/modules/home/repository/home_repository.dart';
import 'package:bankbapakmu/app/modules/home/widgets/blog_widget.dart';
import 'package:bankbapakmu/app/shared/color_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController(
      homeRepository: HomeRepository(homeService: HomeService())));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Assigment'),
          backgroundColor: deepBlue,
        ),
        body: Obx(
          () => Container(
            child: controller.isLoading.value == true
                ? SkeletonListView()
                : controller.homes.isEmpty
                    ? SizedBox()
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(),
                              height: 250,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Card(
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  child: GridView.count(
                                    physics: NeverScrollableScrollPhysics(),
                                    crossAxisCount: 3,
                                    children: [
                                      ...homeController.products.map(
                                        (element) => GestureDetector(
                                          onTap: () {
                                            print('tesss');
                                          },
                                          child: Column(
                                            children: [
                                              Image.network(
                                                element.productImage!,
                                                // scale: 1.2,
                                              ),
                                              Text(
                                                element.productName!,
                                                style:
                                                    TextStyle(fontSize: 16.0),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 12.0),
                              child: Row(children: [
                                Text(
                                  '${homeController.homes[0].sectionTitle}',
                                  style: TextStyle(fontSize: 16.0),
                                )
                              ]),
                            ),
                            Column(
                              children: [
                                ...homeController.articles
                                    .map((element) => GestureDetector(
                                          onTap: () {
                                            homeController
                                                .openUrl(element.link!);
                                          },
                                          child: BlogWidget(
                                            title: element.articleTitle!,
                                            image: element.articleImage!,
                                          ),
                                        ))
                              ],
                            ),
                          ],
                        ),
                      ),
          ),
        ));
  }
}
