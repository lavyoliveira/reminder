import 'package:flutter/material.dart';
import '../widgets/reminder_button.dart';
import '../../shared/theme/theme.dart';

class ReminderButtonsList extends StatelessWidget {
  const ReminderButtonsList({super.key});

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
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
                    child: ReminderButton(label: 'Button $index'),
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
