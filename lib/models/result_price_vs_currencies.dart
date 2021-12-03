import 'dart:convert';

import 'package:as_conversor/models/result_supported_currencies.dart';

class ResultPrice {
  String usdCoin;
  String bitcoin;
  String uniswap;
  String litecoin;
  String cardano;
  ResultSupportedCurrencies brl;

  ResultPrice({
    required this.usdCoin,
    required this.bitcoin,
    required this.uniswap,
    required this.litecoin,
    required this.cardano,
    required this.brl,
  });

  static List<ResultPrice> parsePrice(String responseBody) {
    List<ResultPrice> retorno;
    /*final parsed = json.decode(responseBody).cast<String, dynamic>();
    return parsed
        .map<String, String>((json) => ResultPrice.fromMap(json))
        .toList();*/
    var price = json.decode(responseBody);

    retorno = List<ResultPrice>.from(price.map((e) => ResultPrice.fromJson(e)));

    return retorno;
  }

  factory ResultPrice.fromJson(String str) =>
      ResultPrice.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultPrice.fromMap(Map<String, dynamic> json) => ResultPrice(
        usdCoin: json["usdCoin"],
        bitcoin: json["bitcoin"],
        uniswap: json["uniswap"],
        litecoin: json["litecoin"],
        cardano: json["cardano"],
        brl: json["brl"],
      );

  Map<String, dynamic> toMap() => {
        "usdCoin": usdCoin,
        "bitcoin": bitcoin,
        "uniswap": uniswap,
        "litecoin": litecoin,
        "cardano": cardano,
        "brl": brl,
      };
}
