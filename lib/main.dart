import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ExchangeRate.dart';

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

  ExchangeRate? _dataFromAPI; // ใช้ ? เพื่อแสดงว่า _dataFromAPI สามารถเป็น null ได้
  
  @override
  void initState() {
    super.initState();
    getExchangeRate();
  }

  Future<void> getExchangeRate() async {
    var url =
        "https://v6.exchangerate-api.com/v6/891febb7ba4fa97c0bb088a0/pair/THB/USD";
    var response = await http.get(Uri.parse(url));
    setState(() {
      _dataFromAPI = exchangeRateFromJson(response.body);// json => dart object
    });
  }

  //การแสดงผล
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Exchange rates",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
        ),
        body: Column(
          children: [
            LinearProgressIndicator(),
            Text(_dataFromAPI?.baseCode ?? "Loading...")
          ],
        ));
  }
}
