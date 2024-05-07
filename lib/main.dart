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
  ExchangeRate?
      _dataFromAPI; // ใช้ ? เพื่อแสดงว่า _dataFromAPI สามารถเป็น null ได้

  @override
  void initState() {
    super.initState();
    getExchangeRate();
  }

  Future<ExchangeRate?> getExchangeRate() async {
    var url =
        "https://v6.exchangerate-api.com/v6/891febb7ba4fa97c0bb088a0/pair/THB/USD";
    var response = await http.get(Uri.parse(url));
    _dataFromAPI = exchangeRateFromJson(response.body); // json => dart object
    return _dataFromAPI;
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
        body: FutureBuilder(
          future: getExchangeRate(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            //ดึงข้อมูลจาก getExchangeRate มาครบเรียบร้อยจะให้ทำอะไรต่อ
            if (snapshot.connectionState == ConnectionState.done) {
              var result = snapshot.data;
              return ListView(
                children: [
                  ListTile(
                    title: Text(result.baseCode),
                  ),
                  ListTile(
                    title: Text("${result.targetCode}"),
                  ),
                                    ListTile(
                    title: Text("${result.conversionRate.toString()}"),
                  ),
                ],
              );
            }
            return LinearProgressIndicator();
          },
        ));
  }
}
