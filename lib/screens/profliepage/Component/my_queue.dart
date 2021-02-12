import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:queuenbuapp/models/transactions.dart';
import 'package:queuenbuapp/providers/transaction_provider.dart';

class Queue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, TransactionProvider provider, Widget child) {
          var count = provider.transactions.length; //นับจำนวนข้อมูล
          if (count <= 0) {
            return Center(
              child: Text(
                "ไม่ข้อมูล",
                style: TextStyle(fontSize: 20),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: count,
              itemBuilder: (context, int index) {
                //ดึงรายการจาก provider
                Transactions data = provider.transactions[index];
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: FittedBox(),
                    ),
                    title: Text(data.title),
                    subtitle: Text(DateFormat("dd/MM/yyyy").format(data.date)),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Navigator.push(null,MaterialPageRoute(builder: null))
                      },
                    ),
                    // Icon(Icons.edit),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
