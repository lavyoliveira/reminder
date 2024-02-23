import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder/core/controllers/remindersController.dart';
import '../core/shared/theme/theme.dart';
import '../core/view/screens/reminder_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Reminders',
      theme: AppTheme.darkTheme,
      home: ReminderScreen(),
      onInit: () => Get.put<RemindersController>(RemindersController()),
    );
  }
}