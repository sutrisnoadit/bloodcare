import 'package:bloodcare/app/routes/app_pages.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController {
  //TODO: Implement OnboardController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
     Future.delayed(Duration(seconds: 5), () {
      Get.offNamed(Routes.SIGNIN);
    });
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
