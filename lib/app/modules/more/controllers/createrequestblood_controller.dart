import 'package:get/get.dart';

class BloodRequestController extends GetxController {
  var postTitle = ''.obs;
  var bloodGroup = ''.obs;
  var amountOfBlood = ''.obs;
  var date = ''.obs;
  var hospitalName = ''.obs;
  var reason = ''.obs;
  var contactName = ''.obs;
  var mobileNumber = ''.obs;
  var country = ''.obs;
  var city = ''.obs;

  void submitRequest() {
    // Handle form submission
    print('Form submitted');
  }
}