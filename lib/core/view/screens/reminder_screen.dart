import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/reminder_list.dart';
import '../../shared/theme/theme.dart';
import './add_screen.dart';
import 'package:get/get.dart';
import '../../models/Reminder.dart';
import '../../data/repository/repository.dart';

class ReminderScreen extends StatelessWidget {

  // final reminders = Get.put<List<Reminder>>;

  @override
  Widget build(BuildContext context) {
    var dateNow = DateTime.now();
    List months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    List daysOfWeek = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday'
    ];
    // var repository = ReminderRepository();
    // repository.fetchReminders();
    
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(
                  dia: dateNow.day.toString(),
                  mes: months[dateNow.month - 1],
                  ano: dateNow.year.toString(),
                  diaDaSemana: daysOfWeek[dateNow.weekday - 1],
                ),
                ReminderButtonsList(),
              ],
            ),
            Positioned(
              top: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  showAddReminderDialog(context);
                },
                shape: const CircleBorder(),
                backgroundColor: AppTheme.darkTheme.cardTheme.color,
                child: const Icon(
                  Icons.add,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
