import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreController extends GetxController {
  //TODO: Implement MoreController

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
   void onLogout() {
    // Implementasi logout
    print('Logout clicked');
  }

  void navigateToCreateRequestBlood(BuildContext context) {
    // Navigasi ke halaman Create Request Blood
    
  }

  void navigateToCreateDonorBlood() {
    Get.toNamed('/create-donor-blood');
  }

  void navigateToBloodDonorOrg() {
    Get.toNamed('/blood-donor-org');
  }

  void navigateToFAQ() {
    Get.toNamed('/faq');
  }

  void navigateToCompatibility() {
    Get.toNamed('/compatibility');
  }

  void navigateToBlog() {
    Get.toNamed('/blog');
  }
}
