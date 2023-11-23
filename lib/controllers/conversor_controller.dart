import 'package:flutter/material.dart';
import '../models/retorno_api_model.dart';
import '../repositories/retorno_api_repository.dart';

class ConversorController extends ChangeNotifier {
  RetornoApiRepository repository = RetornoApiRepository();
  RetornoApiModel? dataUSD;
  RetornoApiModel? dataEUR;
  RetornoApiModel? dataBTC;

  bool isLoanding = false;

  geDatatApiUSD() async {
    isLoanding = true;
    try {
      dataUSD = await repository.getUSDtoBRL();
    } on Exception catch (e) {
      throw Exception('Exception $e');
    }
    isLoanding = false;
    notifyListeners();
  }

  geDatatApiEUR() async {
    isLoanding = true;
    try {
      dataEUR = await repository.getEURtoBRL();
    } on Exception catch (e) {
      throw Exception('Exception $e');
    }
    isLoanding = false;
    notifyListeners();
  }

  geDatatApiBTC() async {
    isLoanding = true;
    try {
      dataBTC = await repository.getBTCtoBRL();
    } on Exception catch (e) {
      throw Exception('Exception $e');
    }
    isLoanding = false;
    notifyListeners();
  }
}
