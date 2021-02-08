import 'package:flutter/foundation.dart';
import 'package:queuenbuapp/database/transaction_db.dart';
import 'package:queuenbuapp/models/transactions.dart';

class TransactionProvider with ChangeNotifier {
  //ฐานข้อมูล
  List<Transactions> transactions = [
    // Transaction(title: "กิจกรรม", amount: 500, date: DateTime.now()),
    // Transaction(title: "งาน", amount: 400, date: DateTime.now()),
    // Transaction(title: "สอบ", amount: 300, date: DateTime.now())
  ];
  //ดึงข้อมูล
  List<Transactions> getTransaction() {
    return transactions;
  }

  void addTransaction(Transactions statement) async {
    var db = TransactionDB(dbName: "transactions.db");
    // var db = await TransactionDB(dbName: "transaction.db").openDatabase();
    // print(db);

    //บันทึกข้อมูล
    await db.InsertData(statement);

    transactions.insert(0, statement);

    //แจ้งเตือน Comsumer
    notifyListeners();
  }
}
