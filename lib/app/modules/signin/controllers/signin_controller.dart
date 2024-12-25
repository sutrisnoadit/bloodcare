import 'package:bloodcare/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  //TODO: Implement SigninController
  final mobile = ''.obs;
  final password = ''.obs;

  void login() {
    // Implement login logic here
    print('Login with: ${mobile.value} and ${password.value}');
  }
  final count = 0.obs;
  @override
  void onInit() {
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

  void goToSignup() {
    Get.toNamed(Routes.SIGNUP);
  }
   void goToHome() {
    Get.toNamed(Routes.HOME);
  }

  void increment() => count.value++;
}
