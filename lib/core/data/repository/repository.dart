import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

import '../../models/Reminder.dart';

class ReminderRepository {
  final String baseUrl = 'https://reminder-backend-avsr.vercel.app/reminders';

  Future<List<Reminder>> fetchReminders() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => Reminder.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load reminders');
    }
  }

Future<Reminder> addReminder(String name, String date) async {
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
    return Reminder.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to add reminder');
  }
}

Future<void> deleteReminder(Reminder reminder) async {
  final response = await http.delete(Uri.parse('$baseUrl/${reminder.id}'));
  if (response.statusCode != 200) {
    throw Exception('Failed to delete reminder');
  }
}
}
