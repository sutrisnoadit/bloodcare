import 'package:get/get.dart';

class DetailDonateurController extends GetxController {
  //TODO: Implement DetailDonateurController
  final name = 'Cameron Williamson'.obs;
  final bloodType = 'A+ Blood'.obs;
  final age = '30'.obs;
  final gender = 'Male'.obs;
  final city = 'Dhaka'.obs;
  final country = 'Bangladesh'.obs;
  final mobile = 'Bangladesh'.obs;
  final email = 'Bangladesh'.obs;
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

  void increment() => count.value++;
}
