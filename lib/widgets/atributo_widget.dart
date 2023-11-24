import 'package:flutter/material.dart';

import '../utils/style.dart';

class AtributoWidget extends StatelessWidget {
  final String atualizacao;
  final String compra;
  final String venda;
  final String variacaoValue;
  final String variacaoCor;
  final String maximo;
  final String minimo;

  const AtributoWidget({
    super.key,
    required this.atualizacao,
    required this.compra,
    required this.venda,
    required this.variacaoValue,
    required this.variacaoCor,
    required this.maximo,
    required this.minimo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Atualizado em: $atualizacao', style: h1),
        Text('Compra: $compra', style: h1),
        Text('Venda: $venda', style: h1),
        Row(
          children: [
            Text(
              'Variação: ',
              style: h1,
            ),
            Text(
              variacaoValue,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: variacaoCor.contains('-') ? Colors.red : Colors.green,
              ),
            ),
          ],
        ),
        Text(
          'Maximo: $maximo',
          style: h1,
        ),
        Text(
          'Minimo: $minimo',
          style: h1,
        ),
      ],
    );
  }
}
