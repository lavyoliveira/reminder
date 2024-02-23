import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/repository/repository.dart';
import '../../models/Reminder.dart';
import '../../shared/theme/theme.dart';

class ReminderButton extends StatelessWidget {
  final String name;
  final String date;
  final Reminder reminder;
  Function deleteReminderDinamic;

  ReminderButton({
    super.key,
    required this.name,
    required this.date,
    required this.reminder,
    required this.deleteReminderDinamic,
  });

  void deleteReminder(Reminder reminder) {
    var repository = ReminderRepository();

    Get.dialog(
      AlertDialog(
        title: const Text('Deseja excluir este lembrete?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              repository.deleteReminder(reminder).then((value) => {
                    deleteReminderDinamic(reminder),
                    Get.back(),
                    Get.snackbar(
                      'Lembrete excluído',
                      'O lembrete foi excluído com sucesso',
                      backgroundColor: AppTheme.darkTheme.primaryColor,
                    ),
                  });
            },
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      height: 50,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppTheme.darkTheme.primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 5),
                  child: Text(
                    name,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    date,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Material(
                borderRadius: BorderRadius.circular(50),
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    deleteReminder(reminder);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('assets/icons/excluir.png'),
                      width: 25,
                      height: 25,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
