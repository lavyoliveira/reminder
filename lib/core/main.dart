import 'package:flutter/material.dart';
import '../core/shared/theme/theme.dart';
import '../core/view/screens/reminder_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reminders',
      theme: AppTheme.darkTheme,
      home: ReminderScreen(), // Defina a tela principal do seu aplicativo aqui
    );
  }
}
