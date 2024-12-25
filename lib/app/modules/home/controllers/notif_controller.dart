import 'package:flutter/material.dart';
import 'package:get/get.dart';
class NotificationController extends GetxController {
  final notifications = [
    {
      'title': 'Blood Camp',
      'message': 'Dhaka Center create donation nere you!',
      'time': '12:42 AM',
      'icon': Icons.local_hospital,
      'iconColor': Colors.teal,
      'section': 'Today',
      'isRead': false,
    },
    {
      'title': 'Blood Request',
      'message': 'Mohmd Search O- Blood',
      'time': '12:42 AM',
      'icon': Icons.water_drop,
      'iconColor': Colors.red,
      'section': 'Today',
      'isRead': false,
    },
    {
      'title': 'Facebook live',
      'message': 'Dhaka blood will live today @ 9 PM',
      'time': '12:42 AM',
      'icon': Icons.facebook,
      'iconColor': Colors.blue,
      'section': 'Yesterday',
      'isRead': true,
    },
    {
      'title': 'Message request',
      'message': 'Message recive From Diman. For reply click here',
      'time': '12:42 AM',
      'icon': Icons.message,
      'iconColor': Colors.red,
      'section': 'Yesterday',
      'isRead': true,
    },
  ].obs;

  void markAsRead(int index) {
    final notification = notifications[index];
    notification['isRead'] = true;
    notifications[index] = notification;
  }

  void deleteNotification(int index) {
    notifications.removeAt(index);
  }
}