import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:as_conversor/models/result_price_vs_currencies.dart';

class PriceVsCurrenciesService {
  static Future<List<ResultPrice>> fetchPrice(/*{String? cryptoCoin}*/) async {
    final Uri uri = Uri.parse(
        'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,litecoin,cardano,uniswap,usd-coin&vs_currencies=brl');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      //return ResultPrice.fromJson(response.body);
      return ResultPrice.parsePrice(response.body);
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}
