import 'package:get/get.dart';
class BloodRequest {
  final String title;
  final String hospital;
  final String date;
  final bool isEmergency;

  BloodRequest({
    required this.title,
    required this.hospital,
    required this.date,
    required this.isEmergency,
  });
}

class BloodDonor {
  final String name;
  final String phone;

  BloodDonor({
    required this.name,
    required this.phone,
  });
}
class BlooddonorController extends GetxController {
   final selectedBloodGroup = ''.obs;
  final searchQuery = ''.obs;
  final selectedTags = <String>[].obs;

  final bloodGroups = [
    {'type': 'A+', 'icon': '🩸'},
    {'type': 'A-', 'icon': '🩸'},
    {'type': 'B+', 'icon': '🩸'},
    {'type': 'B-', 'icon': '🩸'},
    {'type': 'AB+', 'icon': '🩸'},
    {'type': 'AB-', 'icon': '🩸'},
    {'type': 'O+', 'icon': '🩸'},
    {'type': 'O-', 'icon': '🩸'},
  ];

  final tags = ['#Baby', '#Oldman', '#Urgents'];

  final recentRequests = <BloodRequest>[
    BloodRequest(
      title: 'Emergency B+ Blood Need for oldman',
      hospital: 'Hospital Name',
      date: '12 Feb 2022',
      isEmergency: true,
    ),
    BloodRequest(
      title: 'Blood Needed for oldman (B+)',
      hospital: 'Hospital Name',
      date: '12 Feb 2022',
      isEmergency: false,
    ),
  ];

  final recentDonors = <BloodDonor>[
    BloodDonor(
      name: 'Cameron Williamson',
      phone: '+88 01818 121212',
    ),
  ];

  void toggleBloodGroup(String bloodGroup) {
    if (selectedBloodGroup.value == bloodGroup) {
      selectedBloodGroup.value = '';
    } else {
      selectedBloodGroup.value = bloodGroup;
    }
  }

  void toggleTag(String tag) {
    if (selectedTags.contains(tag)) {
      selectedTags.remove(tag);
    } else {
      selectedTags.add(tag);
    }
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

  void increment() => count.value++;
}
