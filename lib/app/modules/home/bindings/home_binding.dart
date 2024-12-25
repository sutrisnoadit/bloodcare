import 'package:bloodcare/app/modules/bloodsearch/controllers/bloodsearch_controller.dart';
import 'package:bloodcare/app/modules/home/controllers/blooddonor_controller.dart';
import 'package:bloodcare/app/modules/more/controllers/more_controller.dart';
import 'package:bloodcare/app/modules/more/controllers/settingsprofile_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut(()=>MoreController());
    Get.lazyPut(()=>BloodsearchController());
    Get.lazyPut(()=>ProfileSetupController());
    Get.lazyPut(()=>BlooddonorController());
  }
}
