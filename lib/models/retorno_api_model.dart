import 'package:intl/intl.dart';

class RetornoApiModel {
  USDBRL? uSDBRL;
  USDBRL? eURBRL;
  USDBRL? bTCBRL;

  RetornoApiModel({this.uSDBRL, this.eURBRL, this.bTCBRL});

  RetornoApiModel.fromJson(Map<String, dynamic> json) {
    uSDBRL = json['USDBRL'] != null ? USDBRL.fromJson(json['USDBRL']) : null;
    eURBRL = json['EURBRL'] != null ? USDBRL.fromJson(json['EURBRL']) : null;
    bTCBRL = json['BTCBRL'] != null ? USDBRL.fromJson(json['BTCBRL']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (uSDBRL != null) {
      data['USDBRL'] = uSDBRL!.toJson();
    }
    if (eURBRL != null) {
      data['EURBRL'] = eURBRL!.toJson();
    }
    if (bTCBRL != null) {
      data['BTCBRL'] = bTCBRL!.toJson();
    }
    return data;
  }
}

class USDBRL {
  String? name;
  String? high;
  String? low;
  String? varBid;
  String? bid;
  String? ask;
  String? createDate;

  USDBRL(
      {this.name,
      this.high,
      this.low,
      this.varBid,
      this.bid,
      this.ask,
      this.createDate});

  USDBRL.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    high = json['high'];
    low = json['low'];
    varBid = json['varBid'];
    bid = json['bid'];
    ask = json['ask'];
    createDate = json['create_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['high'] = high;
    data['low'] = low;
    data['varBid'] = varBid;
    data['bid'] = bid;
    data['ask'] = ask;
    data['create_date'] = createDate;
    return data;
  }

  conversaoDate() {
    var conversao =
        DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.parse(createDate!));
    return conversao;
  }
}
