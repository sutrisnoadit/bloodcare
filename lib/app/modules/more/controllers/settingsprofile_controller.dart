import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSetupController extends GetxController {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final dateController = TextEditingController();
  
  final selectedBloodGroup = 'B+'.obs;
  final selectedCountry = 'Bangladesh'.obs;
  final selectedCity = 'Dhaka'.obs;
  final selectedGender = 'Male'.obs;
  final age = 0.obs;

  void calculateAge(DateTime birthDate) {
    final today = DateTime.now();
    age.value = today.year - birthDate.year - 
      (today.month < birthDate.month || 
      (today.month == birthDate.month && today.day < birthDate.day) ? 1 : 0);
  }

  void updateProfile() {
    // Implement profile update logic
    Get.snackbar(
      'Success',
      'Profile updated successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}