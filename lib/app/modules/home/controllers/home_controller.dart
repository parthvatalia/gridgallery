import 'package:gridgallery/app/utils/app_strings.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';
class HomeController extends GetxController {
  RxBool canPop = RxBool(true);
  RxList<dynamic> images = [].obs;

  @override
  void onInit() async {
    fetchImages();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchImages() async {
    final response = await http.get(Uri.parse(
        '${AppStrings.baseUrl}/api/?key=${AppStrings.apiKey}&per_page=200'));
    if (response.statusCode == 200) {
        images.value = json.decode(response.body)[AppStrings.hits];
    } else {
      throw Exception(AppStrings.exception);
    }
  }

  int calculateColumnCount(double screenWidth) {
    const double itemWidth = 150;
    return (screenWidth / itemWidth).floor();
  }




}
