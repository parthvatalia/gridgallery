import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../utils/app_strings.dart';
import '../../../widgets/full_screen_image.dart';
import '../../../widgets/master_page.dart';
import '../controllers/home_controller.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MasterPage(
        resizeToAvoidBottomInset: false,
        backgroundColor:Colors.white,
        canPop: controller.canPop.value,
        appBar: AppBar(
          title: const Text(
            AppStrings.appName,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              wBody(context),
            ],
          ),
        ),
      );
    });
  }

  Widget wBody(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child:   GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: controller.calculateColumnCount(MediaQuery.of(context).size.width),
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: controller.images.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(FullScreenImage(imageUrl: controller.images[index][AppStrings.largeImageURL]));
              },
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.zero,
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Hero(
                        tag: "${controller.images[index][AppStrings.largeImageURL]}",
                        child: Image.network(
                          controller.images[index][AppStrings.previewURL],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          color: Colors.black.withOpacity(0.5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, -2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child:   Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${AppStrings.likes}: ${controller.images[index]['likes']}',
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${AppStrings.views}: ${controller.images[index]['views']}',
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget mHeader(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(
        AppStrings.appName,
        textAlign: TextAlign.start,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
