import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
//import 'package:flutter_masked_text/flutter_masked_text.dart';

import '../models/result_price_vs_currencies.dart';
import '../service/price_vs_currencies_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchValue =
      TextEditingController(); //MoneyMaskedTextController(decimalSeparator: ',');

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Conversor de Criptomoeda'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _textFieldValorEmBrl(),
            _dropdownButtonCurrencies(),
            _elevatedButtonConvert()
          ],
        ),
      ),
    );
  }

  Widget _textFieldValorEmBrl() {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      textAlign: TextAlign.center,
      decoration: const InputDecoration(labelText: 'R\$'),
      controller: _searchValue,
    );
  }

  String dropdownValue = 'BTC';
  Widget _dropdownButtonCurrencies() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['BTC', 'LTC', 'ADA', 'UNI', 'USDC']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _elevatedButtonConvert() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: ElevatedButton(
          onPressed: _searchPrice,
          child: _loading ? _circularLoading() : const Icon(Icons.autorenew),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(120, 48),
            primary: Colors.indigo,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            elevation: 15.0,
          )),
    );
  }

  Future _searchPrice() async {
    _loading = true;

    final valorBrl = _searchValue.text;
    print('First text field: $valorBrl');

    final resultPrice = await PriceVsCurrenciesService.fetchPrice();

    if (resultPrice == null) {
      print("Deu problema");
    } else {
      print("Deu certo");
    }

    _loading = false;
  }

  Widget _circularLoading() {
    return const CircularProgressIndicator();
  }
}
