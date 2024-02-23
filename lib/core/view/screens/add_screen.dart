import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/theme/theme.dart';
import '../../data/repository/repository.dart';
import '../widgets/reminder_list.dart';

void showAddReminderDialog(BuildContext context, GlobalKey<ReminderButtonsListState> key) {
  String name = '';
  String date = '';

  final repository = ReminderRepository();

  void submit() {
    if ((name.isEmpty) || (date.isEmpty)) {
      Get.dialog(
        AlertDialog(
          title: const Text('Nome do lembrete ou data não podem ser vazios'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
      return;
    }

    if(name.length > 36){
      Get.dialog(
        AlertDialog(
          title: const Text('Nome do lembrete não pode ter mais de 36 caracteres'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
      return;
    }

    RegExp regExp =
        RegExp(r'^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-(19|20)\d\d$');
    if (!regExp.hasMatch(date)) {
      Get.dialog(
        AlertDialog(
          title: const Text('Formato do lembrete inválido'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
      return;
    }

    var dateSplitted =
        [date.split('-')[2], date.split('-')[1], date.split('-')[0]].join('-');

    DateTime dateTime = DateTime.parse(dateSplitted);

    DateTime now = DateTime.now();

    if (dateTime.isBefore(now)) {
      Get.dialog(
        AlertDialog(
          title: const Text('Data do lembrete não pode ser no passado'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
      return;
    }

    repository.addReminder(name, dateSplitted).then((value) => {
          key.currentState!.add(value),
          Navigator.of(context).pop(),
          Get.dialog(
            AlertDialog(
              title: const Text('Lembrete criado com sucesso'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'),
                ),
              ],
            ),
          )
        }).catchError((e) {
          Get.dialog(
            AlertDialog(
              title: const Text('Erro ao criar lembrete'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'),
                ),
              ],
            ),
          );
        });
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Novo lembrete',
          style: TextStyles.title,
        ),
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
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
              submit();
            },
            child: const Text('Criar'),
          ),
        ],
      );
    },
  );
}
