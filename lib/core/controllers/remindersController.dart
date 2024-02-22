
import 'package:get/get.dart';
import '../models/Reminder.dart';

class RemindersController extends GetxController {
  final reminders = List<Reminder>.empty().obs;

  @override
  void onInit() {
    fetchReminders();
    super.onInit();
  }

  void fetchReminders() async {
    await Future.delayed(const Duration(seconds: 1));
    reminders.value = List<Reminder>.empty();
  }
}