// DetailPostPage.dart
import 'package:bloodcare/app/modules/home/controllers/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DetailPostPage extends StatelessWidget {
  final DetailPostController controller = Get.put(DetailPostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => controller.highlightImage.value.isNotEmpty
                ? Image.network(
                    controller.highlightImage.value,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Container(height: 200, color: Colors.grey[300])),
            SizedBox(height: 16),
            Obx(() => Text(
                  controller.title.value,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            SizedBox(height: 8),
            Obx(() => Text(
                  controller.details.value,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
