// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/transaction.dart';
import '../provider/transaction_provider.dart';
import 'Page2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  final String title = "แอพบัญชีธนาคาร";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TransactionProvider>(this.context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: [
        IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              SystemNavigator.pop();
            })
      ]),
      body: Consumer(builder: (context, TransactionProvider provider, _) {
        var count = provider.getTransaction().length;
        if (count > 0) {
          return ListView.builder(
              itemCount: count,
              itemBuilder: (context, int index) {
                transaction data = provider.transactions[index];
                return Card(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    elevation: 3,
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child: FittedBox(child: Text('${data.amount}'))),
                      title: Text(data.title),
                      subtitle: Text(
                          DateFormat('dd/MM/yyyy HH:mm').format(data.date)),
                    ));
              });
        } else {
          return Center(child: Text("ไม่มีข้อมูล"));
        }
      }),
    );
  }
}
