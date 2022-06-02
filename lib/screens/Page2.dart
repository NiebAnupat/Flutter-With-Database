// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutterwithdatabase/main.dart';
import 'package:flutterwithdatabase/screens/home.dart';
import 'package:intl/date_symbols.dart';
import 'package:provider/provider.dart';

import '../models/transaction.dart';
import '../provider/transaction_provider.dart';

class Page2 extends StatelessWidget {
  Page2({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("บันทึกข้อมูล"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            TextFormField(
              autofocus: false,
              decoration: InputDecoration(
                labelText: "ชื่อรายการ",
                hintText: "กรุณากรอกข้อมูล",
              ),
              controller: titleController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "กรุณากรอกชื่อรายการ";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "จำนวนเงิน",
                hintText: "กรุณากรอกจำนวนเงิน",
              ),
              controller: amountController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "กรุณากรอกชื่อจำนวนเงิน";
                } else if (double.parse(value) <= 0) {
                  return "กรุณากรอกจำนวนเงินที่ถูกต้อง";
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            FlatButton(
              child: Text("เพิ่มข้อมูล"),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  var title = titleController.text;
                  var amount = amountController.text;
                  var statement = transaction(
                      title: title,
                      amount: double.parse(amount),
                      date: DateTime.now());
                  var provider =
                      Provider.of<TransactionProvider>(context, listen: false);
                  provider.addTransaction(statement);
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}
