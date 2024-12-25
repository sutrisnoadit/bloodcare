import 'package:get/get.dart';
class BlogModel {
  final String title;
  final String date;
  final String imageUrl;

  BlogModel({required this.title, required this.date, required this.imageUrl});
}
class BlogController extends GetxController {
  var blogs = <BlogModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBlogs();
  }

  void fetchBlogs() {
    blogs.value = [
      BlogModel(
        title: 'What to do after donating blood',
        date: '02 Aug 2021',
        imageUrl: 'https://via.placeholder.com/150',
      ),
      BlogModel(
        title: 'After your donation - Give Blood',
        date: '02 Aug 2021',
        imageUrl: 'https://via.placeholder.com/150',
      ),
      BlogModel(
        title: 'Benefits of blood donation',
        date: '02 Aug 2021',
        imageUrl: 'https://via.placeholder.com/150',
      ),
      BlogModel(
        title: 'After your donation - Give Blood',
        date: '02 Aug 2021',
        imageUrl: 'https://via.placeholder.com/150',
      ),
    ];
  }
}