import 'package:flutter/foundation.dart';
import 'package:queuenbuapp/database/transaction_db.dart';
import 'package:queuenbuapp/models/transactions.dart';
import 'package:queuenbuapp/models/user_model.dart';

class TransactionProvider with ChangeNotifier {
  //ฐานข้อมูล
  List<Transactions> transactions = [];

  List<UserModels> usernames = [
    UserModels(user_name: "sarul"),
    UserModels(id_user: "601110951"),
  ];

  //ดึงข้อมูล
  List<UserModels> getUserModels() {
    return usernames;
  }

  List<Transactions> getTransaction() {
    return transactions;
  }

  void initData() async {
    var db = TransactionDB(dbName: "transaction.db");
    // ดึงข้อมูลมาแสดงผล
    transactions = await db.loadAllData();
    notifyListeners();
  }

  void addTransaction(Transactions statement) async {
    var db = TransactionDB(dbName: "transactions.db");

    // บันทึกข้อมูล
    await db.InsertData(statement);
    // ดึงข้อมูลมาแสดงข้อมูล
    transactions = await db.loadAllData();

    //แจ้งเตือน Comsumer
    notifyListeners();
  }

  void addUserModels(UserModels statement) {
    // ดึงข้อมูลมาแสดงข้อมูล
    usernames.add(statement);
  }
}
