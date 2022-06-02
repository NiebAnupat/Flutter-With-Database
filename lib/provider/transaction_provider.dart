import 'package:flutter/foundation.dart';
import 'package:flutterwithdatabase/database/tansaction_db.dart';
import 'package:flutterwithdatabase/models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<transaction> transactions = [];

  getTransaction() => transactions;

  addTransaction(transaction statement) async {
    var db = TransactionDB(DB_NAME: "transaction.db");
    await db.InsertData(statement);
    transactions.insert(0, statement);
    notifyListeners();
  }

  initData() async {
    var db = TransactionDB(DB_NAME: "transaction.db");
    transactions = await db.loadAllData();
    notifyListeners();
  }
}
