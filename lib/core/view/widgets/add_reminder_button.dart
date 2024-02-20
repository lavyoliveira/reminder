import 'package:flutter/material.dart';

class AddReminderButton extends StatelessWidget {
  final Function() onPressed;

  const AddReminderButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.blue, // Cor de fundo do botão flutuante
      child: const Icon(Icons.add), // Ícone do botão flutuante
    );
  }
}
