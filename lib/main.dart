import 'package:flutter/material.dart';
import 'MoneyBox.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
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
  //การแสดงผล
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "บัญชีของฉัน",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              MoneyBox("ยอดคงเหลือ", 30000, Colors.lightBlue, 100),
              SizedBox(height: 5,),
              MoneyBox("รายรับ", 60000, Colors.green, 100),
              SizedBox(height: 5,),
              MoneyBox("รายจ่าย", 3000000.55, Colors.red, 100),
              SizedBox(height: 5,),
              MoneyBox("ค้างชำระ", 5000, Colors.orange, 100),
            ],
          ),
        ));
  }
}
