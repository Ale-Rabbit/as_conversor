import 'dart:convert';

class ResultCoins {
  String id;
  String symbol;
  String name;

  ResultCoins({
    required this.id,
    required this.symbol,
    required this.name,
  });

  factory ResultCoins.fromJson(String str) =>
      ResultCoins.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultCoins.fromMap(Map<String, dynamic> json) => ResultCoins(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "symbol": symbol,
        "name": name,
      };
}
