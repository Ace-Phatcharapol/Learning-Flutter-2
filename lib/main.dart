import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ExchangeRate.dart';
import 'MoneyBox.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Exchange rates api project",
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ExchangeRate? _dataFromAPI;
  double getTextValue = 0;

  @override
  void initState() {
    super.initState();
    getExchangeRate();
  }

  Future<ExchangeRate?> getExchangeRate() async {
    var url =
        "https://v6.exchangerate-api.com/v6/891febb7ba4fa97c0bb088a0/latest/USD";
    var response = await http.get(Uri.parse(url));
    _dataFromAPI = exchangeRateFromJson(response.body);
    return _dataFromAPI;
  }

  TextEditingController _controller = TextEditingController();
  String _inputData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Exchange rates",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'สกุลเงิน (USD)',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              onChanged: (value) {
                setState(() {
                  getTextValue = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            MoneyBox(
              "แปลง USD เป็น THB",
              _dataFromAPI != null
                  ? getTextValue * (_dataFromAPI!.conversionRates!["THB"] ?? 0)
                  : 0,
              Colors.greenAccent,
              100,
            ),
            SizedBox(height: 5),
            MoneyBox(
              "แปลง USD เป็น EUR",
              _dataFromAPI != null
                  ? getTextValue * (_dataFromAPI!.conversionRates!["EUR"] ?? 0)
                  : 0,
              Colors.redAccent,
              100,
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
