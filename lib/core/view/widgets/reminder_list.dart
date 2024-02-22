import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder/core/models/Reminder.dart';
import '../widgets/reminder_button.dart';
import '../../shared/theme/theme.dart';
import '../../controllers/remindersController.dart';
import '../../data/repository/repository.dart';

class ReminderButtonsList extends StatefulWidget {
  const ReminderButtonsList({super.key});

  @override
  State<ReminderButtonsList> createState() => _ReminderButtonsList();
  
}

class _ReminderButtonsList extends State<ReminderButtonsList> {
  List<Reminder> reminders = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    var remindersController = Get.find<RemindersController>();
    var remindersRepository = ReminderRepository();

if(mounted){
      remindersRepository.fetchReminders().then((value) {
        setState(() {
        reminders = value;
        loading = false;
    });
    });
  }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.darkTheme.cardTheme.color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 20.0, bottom: 10),
              child: Text(
                'Lista de lembretes',
                style: TextStyles.title, 
              ),
            ),
            Expanded(
              child: loading ? const Center(child: CircularProgressIndicator()) : ListView.builder(
                itemCount: reminders.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
                    child: ReminderButton(
                      name: reminders[index].name,
                      date: reminders[index].date.toString(),
                      ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
