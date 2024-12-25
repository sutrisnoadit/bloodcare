import 'package:get/get.dart';
class BloodCompatibility {
  final String bloodType;
  final String canGiveTo;
  final String canReceiveFrom;

  BloodCompatibility({
    required this.bloodType,
    required this.canGiveTo,
    required this.canReceiveFrom,
  });
}

// blood_compatibility_controller.dart


class BloodCompatibilityController extends GetxController {
  final compatibilityData = <BloodCompatibility>[
    BloodCompatibility(
      bloodType: 'A+',
      canGiveTo: 'A+ AB+',
      canReceiveFrom: 'A+ A- O+ O-',
    ),
    BloodCompatibility(
      bloodType: 'A-',
      canGiveTo: 'A+ A- AB+ AB-',
      canReceiveFrom: 'A- O-',
    ),
    BloodCompatibility(
      bloodType: 'B+',
      canGiveTo: 'B+ AB+',
      canReceiveFrom: 'B+ B- O+ O-',
    ),
    BloodCompatibility(
      bloodType: 'B-',
      canGiveTo: 'B+ B- AB+ AB-',
      canReceiveFrom: 'B- O-',
    ),
    BloodCompatibility(
      bloodType: 'AB+',
      canGiveTo: 'AB+',
      canReceiveFrom: 'Everyone',
    ),
    BloodCompatibility(
      bloodType: 'AB-',
      canGiveTo: 'AB+ AB-',
      canReceiveFrom: 'AB- A- B- O-',
    ),
    BloodCompatibility(
      bloodType: 'O+',
      canGiveTo: 'O+ A+ B+ AB+',
      canReceiveFrom: 'O+ O-',
    ),
    BloodCompatibility(
      bloodType: 'O-',
      canGiveTo: 'Everyone',
      canReceiveFrom: 'O-',
    ),
  ].obs;
}
