import 'dart:convert';

class ResultSupportedCurrencies {
  String brl;

  ResultSupportedCurrencies({
    required this.brl,
  });

  factory ResultSupportedCurrencies.fromJson(String str) =>
      ResultSupportedCurrencies.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultSupportedCurrencies.fromMap(Map<String, dynamic> json) =>
      ResultSupportedCurrencies(
        brl: json["brl"],
      );

  Map<String, dynamic> toMap() => {
        "brl": brl,
      };
}
