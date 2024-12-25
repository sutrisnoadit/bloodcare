
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:image_picker/image_picker.dart';
class CreatePostController extends GetxController {
  var postTitle = ''.obs;
  var description = ''.obs;
  var imagePath = ''.obs;

  void pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
    }
  }

  void submitPost() {
    if (postTitle.value.isEmpty || description.value.isEmpty || imagePath.value.isEmpty) {
      Get.snackbar('Error', 'All fields are required.',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    Get.snackbar('Success', 'Post created successfully!',
        snackPosition: SnackPosition.BOTTOM);
    // Add logic to save or submit the post here.
  }
}
