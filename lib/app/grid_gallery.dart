
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gridgallery/app/routes/app_pages.dart';
import 'package:gridgallery/app/utils/app_strings.dart';



class GridGallery extends StatelessWidget {
  const GridGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      transitionDuration: const Duration(milliseconds: 300),
      defaultTransition: Transition.fadeIn,
      title: AppStrings.appName,
    );
  }
}

