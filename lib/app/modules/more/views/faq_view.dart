import 'package:bloodcare/app/modules/more/controllers/faq_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FaqView extends GetView {
  final FAQController controller = Get.put(FAQController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.faqList.length,
          itemBuilder: (context, index) {
            final faq = controller.faqList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${index + 1}. ${faq['question']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    faq['answer']!,
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  Divider(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
