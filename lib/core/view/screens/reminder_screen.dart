import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/carousel.dart';
import '../widgets/reminder_list.dart';
import '../../shared/theme/theme.dart';
import './add_screen.dart';

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(
                  dia: "20",
                  mes: "Fevereiro",
                  ano: "2024",
                  diaDaSemana: "Saturday",
                ),
                SizedBox(
                  height: 180,
                  child: Carousel(),
                ),
                ReminderButtonsList(),
              ],
            ),
            Positioned(
              top: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  showAddReminderDialog(context);
                },
                shape: const CircleBorder(),
                backgroundColor: AppTheme.darkTheme.cardTheme.color,
                child: const Icon(
                  Icons.add,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
