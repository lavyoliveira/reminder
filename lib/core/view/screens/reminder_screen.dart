import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/carousel.dart';
import '../widgets/reminder_list.dart'; 

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(
              dia: "20",
              mes: "Fevereiro",
              ano: "2024",
              diaDaSemana: "Saturday",
            ),
            SizedBox(
              height: 180,
              child: Carousel(),
            ),
            const ReminderButtonsList(),
          ],
        ),
      ),
    );
  }
}
