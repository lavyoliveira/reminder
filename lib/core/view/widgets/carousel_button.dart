import 'package:flutter/material.dart';
import '../../shared/theme/theme.dart';

class CarouselButton extends StatelessWidget {
  final String date;
  final String dayOfWeek;

  const CarouselButton({
    required this.date,
    required this.dayOfWeek,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppTheme.darkTheme.cardTheme.color
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date,
          ),
          Text(
            dayOfWeek,
          ),
        ],
      ),
    );
  }
}

