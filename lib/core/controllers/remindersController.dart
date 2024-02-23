
import 'package:get/get.dart';

import '../models/Reminder.dart';
import '../data/repository/repository.dart';

class RemindersController extends GetxController {
  final reminders = List<Reminder>.empty().obs;

  @override
  void onInit() {
    super.onInit();
  }

  void fetchReminders() async {
    var repository = ReminderRepository();
    reminders.value = await repository.fetchReminders();
  }

  void add(Reminder reminder) {
    reminders.add(reminder);
    reminders.sort((a, b) => a.date.compareTo(b.date));
  }

  void delete(Reminder reminder) {
    reminders.remove(reminder);
  }
  
}