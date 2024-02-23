import 'package:flutter/material.dart';

import '../widgets/header.dart';
import '../widgets/reminder_list.dart';
import '../../shared/theme/theme.dart';
import './add_screen.dart';

class ReminderScreen extends StatelessWidget {
  GlobalKey<ReminderButtonsListState> reminderButtonsListKey = GlobalKey();


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
                ReminderButtonsList(key: reminderButtonsListKey),
              ],
            ),
            Positioned(
              top: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  showAddReminderDialog(context, reminderButtonsListKey);
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
