// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'Page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'แอพบัญชีธนาคาร'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: [
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Page2()));
            })
      ]),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, int index) {
            return Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                elevation: 3,
                child: ListTile(
                  leading: CircleAvatar(
                      radius: 20, child: Icon(Icons.attach_money, size: 30)),
                  title: Text("รายการที่ ${index + 1}"),
                  subtitle: Text("รายการที่ ${index + 1}"),
                ));
          }),
    );
  }
}
