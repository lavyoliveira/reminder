import 'package:flutter/material.dart';

import '../../shared/theme/theme.dart';

class Header extends StatelessWidget {
  final String dia;
  final String mes;
  final String ano;
  final String diaDaSemana;

  const Header({super.key, 
    required this.dia,
    required this.mes,
    required this.ano,
    required this.diaDaSemana,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dia,
                  style: TextStyles.header,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      mes,
                      style: TextStyles.title,
                    ),
                    const Text(
                      ', ',
                      style: TextStyles.title,
                    ),
                    Text(
                      ano,
                      style: TextStyles.title,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      diaDaSemana,
                      
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
