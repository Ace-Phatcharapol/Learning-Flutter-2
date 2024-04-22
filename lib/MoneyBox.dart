import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//สร้าง container ต้นแบบ
class MoneyBox extends StatelessWidget {
  String title; //ชื่อหมวดหมู่
  double amount; //จำนวนเงิน
  Color color; //สีของกล่อง
  double size; //ขนาดของกล่อง

  MoneyBox(this.title, this.amount, this.color, this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      height: size,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.w700),
          ),
          Expanded(
            child: Text(
              '${NumberFormat("#,###.##").format(amount)}',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
