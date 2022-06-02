// ignore_for_file: non_constant_identifier_names, prefer_collection_literals, deprecated_member_use, unused_local_variable

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import '../models/transaction.dart';

class TransactionDB {
  late String DB_NAME;

  TransactionDB({required this.DB_NAME});

  Future<Database> openDatabase() async {
    var appDirectory = await getApplicationDocumentsDirectory();
    var DB_path = join(appDirectory.path, DB_NAME);
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(DB_path);
    return db;
  }

  Future<int> InsertData(transaction statement) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store('transaction');
    var keyID = await store.add(db, {
      'title': statement.title,
      'amount': statement.amount,
      'date': statement.date.toIso8601String(),
    });
    db.close();
    print("Inserted key : $keyID");
    return keyID;
  }

  Future<List<transaction>> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store('transaction');
    var snapshot = await store.find(db,finder: Finder(sortOrders: [SortOrder(Field.key, false)]));
    var transactionList = <transaction>[];
    for (var record in snapshot) {
      transactionList.add(
        transaction(
          title: record['title'].toString(),
          amount: double.parse(record['amount'].toString()),
          date: DateTime.parse(record['date'].toString()),
        ),
      );
    }
    return transactionList;
  }
}
