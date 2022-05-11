// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("บันทึกข้อมูล"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "ชื่อ",
                  hintText: "กรุณากรอกชื่อ",
                )),
            SizedBox(height: 20),
            TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "จำนวนเงิน",
                  hintText: "กรุณากรอกจำนวนเงิน",
                )),
            SizedBox(height: 10),
            FlatButton(
              child: Text("เพิ่มข้อมูล"),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ]),
        ),
      ),
    );
  }
}
