import 'dart:convert';

import 'package:conversor_moeda/models/retorno_api_model.dart';
import 'package:http/http.dart' as http;

import '../utils/contants.dart';

class RetornoApiRepository {
  var client = http.Client();
  Future<RetornoApiModel?> getUSDtoBRL() async {
    try {
      final response = await client.get(Uri.parse(usdTobrl));
      if (response.statusCode == 200) {
        return RetornoApiModel.fromJson(jsonDecode(response.body));
      }
    } on Exception catch (e) {
      throw Exception('Exception $e');
    }
    return null;
  }

  Future<RetornoApiModel?> getEURtoBRL() async {
    try {
      final response = await client.get(Uri.parse(eurTobrl));
      if (response.statusCode == 200) {
        return RetornoApiModel.fromJson(jsonDecode(response.body));
      }
    } on Exception catch (e) {
      throw Exception('Exception $e');
    }
    return null;
  }

  Future<RetornoApiModel?> getBTCtoBRL() async {
    try {
      final response = await client.get(Uri.parse(btcTobrl));
      if (response.statusCode == 200) {
        return RetornoApiModel.fromJson(jsonDecode(response.body));
      }
    } on Exception catch (e) {
      throw Exception('Exception $e');
    }
    return null;
  }
}
