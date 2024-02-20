import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/carousel.dart';

class ReminderScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Header(
              dia: "20",
              mes: "Fevereiro",
              ano: "2024",
              diaDaSemana: "Saturday",
            ),
            Expanded(
              child: Carousel(),
              ) ,
          ],
        ),
      ),
    );
  }
}
