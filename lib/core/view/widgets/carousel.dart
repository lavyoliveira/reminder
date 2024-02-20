import 'package:flutter/material.dart';
import 'carousel_button.dart'; 

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 130,
        child: ListView.builder(
          scrollDirection: Axis.horizontal, // Define a direção do scroll horizontal
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CarouselButton(
                date: 'Date $index',
                dayOfWeek: 'Day $index',
              ),
            );
          },
        ),
      ),
    );
  }
}
