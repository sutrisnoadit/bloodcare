import 'package:get/get.dart';

import '../controllers/detail_donateur_controller.dart';

class DetailDonateurBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailDonateurController>(
      () => DetailDonateurController(),
    );
  }
}
