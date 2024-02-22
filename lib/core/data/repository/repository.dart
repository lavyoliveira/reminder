import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

import '../../models/Reminder.dart';

class ReminderRepository {
  final String baseUrl = 'https://reminder-backend-avsr.vercel.app/reminders';

  Future fetchReminders() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var reminders = Get.find<List<Reminder>>();
      final List<dynamic> jsonData = jsonDecode(response.body);
      reminders = jsonData.map((json) => Reminder.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load reminders');
    }
  }

Future addReminder(String name, String date) async {
  Map<String, String> reminderData = {
    'name': name,
    'date': date,
  };
  final response = await http.post(
    Uri.parse(baseUrl),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(reminderData),
  );
  if (response.statusCode == 201) {
    // var reminders = Get.find<Future<List<Reminder>>>();
    // reminders.then((value) => print(value.length));
    // reminders.then((value) => value.add(Reminder.fromJson(jsonDecode(response.body))));
  } else {
    throw Exception('Failed to add reminder');
  }
}
}