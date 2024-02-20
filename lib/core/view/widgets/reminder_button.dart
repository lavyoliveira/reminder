import 'package:flutter/material.dart';
import 'package:reminder/core/shared/theme/theme.dart';

class ReminderButton extends StatelessWidget {
  final String label;

  const ReminderButton({super.key, 
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      height: 50,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppTheme.darkTheme.primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                label,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Material(
                borderRadius: BorderRadius.circular(50),
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    // Ação ao tocar na imagem
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('assets/icons/excluir.png'),
                      width: 25,
                      height: 25,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
