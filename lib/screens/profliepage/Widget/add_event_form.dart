import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:queuenbuapp/models/transactions.dart';
import 'package:queuenbuapp/providers/transaction_provider.dart';

class EventForm extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  //controller
  final titleController = TextEditingController(); //รับต่าชื่อ
  final amountController = TextEditingController(); //รับค่ารายละเอียด
  // final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddEvent'),
        backgroundColor: Colors.indigoAccent[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: new InputDecoration(labelText: "ชื่อกิจกรรม"),
                autofocus: true,
                controller: titleController,
                validator: (String str) {
                  //ชื่อรายการเป็นค่าว่าง
                  if (str.isEmpty) {
                    return "กรุณาป้อนชื่อกิจกกรม";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: new InputDecoration(labelText: "รายละเอียด"),
                controller: amountController,
                // keyboardType: TextInputType.number,
              ),
              FlatButton(
                child: Text("ยืนยันการเพิ่มกิจกรรม"),
                color: Colors.blue,
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    var title = titleController.text;
                    var amount = amountController.text;

                    // print(title);
                    // print(amont);

                    //ข้อมูล
                    Transactions statement =
                        Transactions(title: title, date: DateTime.now());

                    //เรียก provider
                    var provider = Provider.of<TransactionProvider>(context,
                        listen: false);
                    provider.addTransaction(statement);
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
