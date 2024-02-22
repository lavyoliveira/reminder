
import 'package:get/get.dart';
import '../models/Reminder.dart';
import '../data/repository/repository.dart';

class RemindersController extends GetxController {
  final reminders = List<Reminder>.empty().obs;

  @override
  void onInit() {
    // fetchReminders();
    super.onInit();
  }

  void fetchReminders() async {
    var repository = ReminderRepository();
    reminders.value = await repository.fetchReminders();
  }
  
}