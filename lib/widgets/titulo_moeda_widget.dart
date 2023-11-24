import 'package:flutter/material.dart';

class TituloMoedaWidget extends StatelessWidget {
  final String nome;
  const TituloMoedaWidget({super.key, required this.nome});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      width: 375,
      child: Text(
        nome,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
