import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final String userName = "User name";
  final String donateStatus = "Off";
  final int donorPosts = 120;
  final int recentPosts = 120;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }
  var currentIndex = 0.obs;

  void updateIndex(int index) {
    currentIndex.value = index;
  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
