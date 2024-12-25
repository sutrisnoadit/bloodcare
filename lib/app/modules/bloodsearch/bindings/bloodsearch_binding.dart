import 'package:get/get.dart';

import '../controllers/bloodsearch_controller.dart';

class BloodsearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BloodsearchController>(
      () => BloodsearchController(),
    );
  }
}
