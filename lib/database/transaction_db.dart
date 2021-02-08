import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:queuenbuapp/models/transactions.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TransactionDB {
  //บริการเกี่ยวกับ
  String dbName; //เก็บชื่อฐานข้อมูล
  //ถ้ายังไม่ถูกสร้าง => สร้าง
  //ถ้าสร้างไว้แล้ว => เปิด
  TransactionDB({this.dbName});

  //db = transaction.db
  Future<Database> openDatabase() async {
    //หาตำแหน่งที่จะเก็บข้อมูล
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbName);

    // สร้าง database
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  // บันทึกข้อมูล
  InsertData(Transactions statement) async {
    //ฐานข้อมูล => Store
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");

    // json
    var keyID = store.add(db, {
      "title": statement.title,
      "amount": statement.amount,
      "date": statement.date.toIso8601String()
    });
    db.close();
    return keyID;
  }
}
