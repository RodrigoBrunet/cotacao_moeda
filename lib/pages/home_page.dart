import 'package:conversor_moeda/controllers/conversor_controller.dart';
import 'package:conversor_moeda/widgets/atributo_widget.dart';
import 'package:conversor_moeda/widgets/flag_widget.dart';
import 'package:conversor_moeda/widgets/titulo_moeda_widget.dart';
import 'package:flutter/material.dart';

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
                    TituloMoedaWidget(nome: usd?.name ?? ''),
                    const SizedBox(height: 10),
                    AtributoWidget(
                        atualizacao: usd?.conversaoDate() ?? '',
                        compra: usd?.bid ?? '',
                        venda: usd?.ask ?? '',
                        variacaoValue: usd?.varBid ?? '',
                        variacaoCor: usd!.varBid!,
                        maximo: usd.high ?? '',
                        minimo: usd.low ?? ''),
                    const SizedBox(
                      height: 30,
                    ),
                    const FlagWidget(
                        pathImage: 'assets/imagens/euro.png',
                        textCoin: 'EUR',
                        pathImageBRL: 'assets/imagens/brasil.png',
                        textCoinBRL: 'BRL'),
                    TituloMoedaWidget(nome: eur?.name ?? ''),
                    const SizedBox(height: 10),
                    AtributoWidget(
                        atualizacao: eur?.conversaoDate() ?? '',
                        compra: eur?.bid ?? '',
                        venda: eur?.ask ?? '',
                        variacaoValue: eur?.varBid ?? '',
                        variacaoCor: eur!.varBid!,
                        maximo: eur.high ?? '',
                        minimo: eur.low ?? ''),
                    const SizedBox(
                      height: 30,
                    ),
                    const FlagWidget(
                        pathImage: 'assets/imagens/bit.png',
                        textCoin: 'BTC',
                        pathImageBRL: 'assets/imagens/brasil.png',
                        textCoinBRL: 'BRL'),
                    TituloMoedaWidget(nome: btc?.name ?? ''),
                    const SizedBox(height: 10),
                    AtributoWidget(
                        atualizacao: btc?.conversaoDate() ?? '',
                        compra: btc?.bid ?? '',
                        venda: btc?.ask ?? '',
                        variacaoValue: btc?.varBid ?? '',
                        variacaoCor: btc!.varBid!,
                        maximo: btc.high ?? '',
                        minimo: btc.low ?? ''),
                  ],
                ),
              ),
            ),
    );
  }
}
