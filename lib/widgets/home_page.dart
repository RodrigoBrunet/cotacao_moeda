import 'package:conversor_moeda/controllers/conversor_controller.dart';
import 'package:conversor_moeda/widgets/flag_widget.dart';
import 'package:flutter/material.dart';

import '../utils/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ConversorController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      listener();
    });
    caregaDadosApi();
  }

  void listener() {
    setState(() {});
  }

  void caregaDadosApi() async {
    await controller.geDatatApiUSD();
    await controller.geDatatApiEUR();
    await controller.geDatatApiBTC();
  }

  @override
  Widget build(BuildContext context) {
    var usd = controller.dataUSD?.uSDBRL;
    var eur = controller.dataEUR?.eURBRL;
    var btc = controller.dataBTC?.bTCBRL;
    return Scaffold(
      body: controller.isLoanding == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 56),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                        child: Text(
                      'Cotação de moedas online',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(height: 30),
                    const FlagWidget(
                      pathImage: 'assets/imagens/usa.png',
                      textCoin: 'USD',
                      pathImageBRL: 'assets/imagens/brasil.png',
                      textCoinBRL: 'BRL',
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15),
                      width: 375,
                      child: Text(
                        usd?.name ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Atualizado em: ${usd?.conversaoData() ?? ''}',
                      style: h1,
                    ),
                    Text(
                      'Compra: ${usd?.bid ?? ''}',
                      style: h1,
                    ),
                    Text(
                      'Venda: ${usd?.ask ?? ''}',
                      style: h1,
                    ),
                    Row(
                      children: [
                        Text(
                          'Variação: ',
                          style: h1,
                        ),
                        Text(
                          usd?.varBid ?? '',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: usd!.varBid!.contains('-')
                                  ? Colors.red
                                  : Colors.green),
                        ),
                      ],
                    ),
                    Text(
                      'Maximo: ${usd.high ?? ''}',
                      style: h1,
                    ),
                    Text(
                      'Minimo: ${usd.low ?? ''}',
                      style: h1,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const FlagWidget(
                        pathImage: 'assets/imagens/euro.png',
                        textCoin: 'EUR',
                        pathImageBRL: 'assets/imagens/brasil.png',
                        textCoinBRL: 'BRL'),
                    Container(
                      padding: const EdgeInsets.only(top: 15),
                      width: 375,
                      child: Text(
                        eur?.name ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Atualizado em: ${eur?.conversaoData() ?? ''}',
                      style: h1,
                    ),
                    Text(
                      'Compra: ${eur?.bid ?? ''}',
                      style: h1,
                    ),
                    Text(
                      'Venda: ${eur?.ask ?? ''}',
                      style: h1,
                    ),
                    Row(
                      children: [
                        Text(
                          'Variação: ',
                          style: h1,
                        ),
                        Text(
                          eur?.varBid ?? '',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: eur!.varBid!.contains('-')
                                  ? Colors.red
                                  : Colors.green),
                        ),
                      ],
                    ),
                    Text(
                      'Maximo: ${eur.high ?? ''}',
                      style: h1,
                    ),
                    Text(
                      'Minimo: ${eur.low ?? ''}',
                      style: h1,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const FlagWidget(
                        pathImage: 'assets/imagens/bit.png',
                        textCoin: 'BTC',
                        pathImageBRL: 'assets/imagens/brasil.png',
                        textCoinBRL: 'BRL'),
                    Container(
                      padding: const EdgeInsets.only(top: 15),
                      width: 375,
                      child: Text(
                        btc?.name ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Atualizado em: ${btc?.conversaoData() ?? ''}',
                      style: h1,
                    ),
                    Text(
                      'Compra: ${btc?.bid ?? ''}',
                      style: h1,
                    ),
                    Text(
                      'Venda: ${btc?.ask ?? ''}',
                      style: h1,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Variação: ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          btc?.varBid ?? '',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: btc!.varBid!.contains('-')
                                  ? Colors.red
                                  : Colors.green),
                        ),
                      ],
                    ),
                    Text(
                      'Maximo: ${btc.high ?? ''}',
                      style: h1,
                    ),
                    Text(
                      'Minimo: ${btc.low ?? ''}',
                      style: h1,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
