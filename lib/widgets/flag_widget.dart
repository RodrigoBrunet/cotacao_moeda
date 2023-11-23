import 'package:flutter/material.dart';

class FlagWidget extends StatelessWidget {
  final String pathImage;
  final String pathImageBRL;
  final String textCoin;
  final String textCoinBRL;

  const FlagWidget(
      {super.key,
      required this.pathImage,
      required this.textCoin,
      required this.pathImageBRL,
      required this.textCoinBRL});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          pathImage,
          width: 35,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 30,
        ),
        Text(
          textCoin,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(
          width: 30,
        ),
        const Icon(Icons.arrow_right_alt_outlined),
        const SizedBox(
          width: 50,
        ),
        Image.asset(
          pathImageBRL,
          width: 35,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 30,
        ),
        Text(
          textCoinBRL,
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
