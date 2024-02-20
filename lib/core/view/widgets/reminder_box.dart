import 'package:flutter/material.dart';
import 'reminder.dart';

class ReminderBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 200, // Defina uma altura fixa para o ReminderBox
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: PageView.builder(
        itemCount: 5, // Número de ReminderButtons
        itemBuilder: (context, index) {
          return Center(
            child: ReminderButton(label: 'Meu Botão $index'),
          );
        },
      ),
    );
  }
}
