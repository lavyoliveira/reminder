import 'package:flutter/material.dart';
import 'package:reminder/core/view/screens/reminder_screen.dart';
import '../../shared/theme/theme.dart';
import '../../data/repository/repository.dart';

void showAddReminderDialog(BuildContext context) {
  String name = '';
  String date = '';

  final repository = ReminderRepository();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Novo lembrete', style: TextStyles.title,),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 50,
              child: TextFormField(
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(
                  labelText: 'Nome do lembrete',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: AppTheme.darkTheme.cardTheme.color,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: TextFormField(
                onChanged: (value) {
                  date = value;
                },
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Data do lembrete (dd-mm-aaaa)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await repository.addReminder(name, date);
                Navigator.of(context).pop();
              } catch (e) {
                print('Erro ao adicionar lembrete: $e');
              }
            },
            child: const Text('Criar'),
          ),
        ],
      );
    },
  );
}
