import 'package:bloodcare/app/modules/home/controllers/notif_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NotifView extends GetView {

  final controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Notification',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_outline, color: Colors.grey[600]),
            onPressed: () {
              Get.defaultDialog(
                title: 'Clear All Notifications',
                middleText: 'Are you sure you want to clear all notifications?',
                textConfirm: 'Clear',
                textCancel: 'Cancel',
                confirmTextColor: Colors.white,
                onConfirm: () {
                  controller.notifications.clear();
                  Get.back();
                },
              );
            },
          ),
        ],
      ),
      body: Obx(
        () => controller.notifications.isEmpty
            ? _buildEmptyState()
            : ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: controller.notifications.length,
                itemBuilder: (context, index) {
                  final notification = controller.notifications[index];
                  final showSection = index == 0 ||
                      (index > 0 &&
                          notification['section'] !=
                              controller.notifications[index - 1]['section']);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (showSection)
                        _buildSectionHeader(notification['section'] as String),
                      _buildNotificationTile(notification, index),
                    ],
                  );
                },
              ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_off_outlined,
            size: 80,
            color: Colors.grey[400],
          ),
          SizedBox(height: 16),
          Text(
            'No notifications yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'You\'ll receive notifications here',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.blue[800],
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationTile(Map<String, dynamic> notification, int index) {
    return Dismissible(
      key: UniqueKey(),
      background: _buildDismissBackground(alignment: Alignment.centerLeft),
      secondaryBackground: _buildDismissBackground(alignment: Alignment.centerRight),
      onDismissed: (direction) {
        controller.deleteNotification(index);
        Get.snackbar(
          'Notification Deleted',
          'The notification has been removed',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black87,
          colorText: Colors.white,
          margin: EdgeInsets.all(8),
          duration: Duration(seconds: 2),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: Offset(0, 2),
              blurRadius: 5,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => controller.markAsRead(index),
            child: Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  _buildIcon(notification),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              notification['title'] as String,
                              style: TextStyle(
                                fontWeight: notification['isRead'] as bool ? FontWeight.w500 : FontWeight.w700,
                                fontSize: 16,
                                color: notification['isRead'] as bool ? Colors.grey[800] : Colors.black,
                              ),
                            ),
                            if (!(notification['isRead'] as bool))
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 6),
                        Text(
                          notification['message'] as String,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          notification['time'] as String,
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(Map<String, dynamic> notification) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: (notification['iconColor'] as Color).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        notification['icon'] as IconData,
        color: notification['iconColor'] as Color,
        size: 24,
      ),
    );
  }

  Widget _buildDismissBackground({required Alignment alignment}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: alignment,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Icon(
        Icons.delete_outline,
        color: Colors.red,
      ),
    );
  }
}
