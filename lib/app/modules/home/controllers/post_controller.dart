import 'package:get/get.dart';

class DetailPostController extends GetxController {
  var highlightImage = ''.obs;
  var title = ''.obs;
  var details = ''.obs;

  void setPostData(String image, String postTitle, String postDetails) {
    highlightImage.value = image;
    title.value = postTitle;
    details.value = postDetails;
  }
}
