import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:money_management/model/data.dart';
import 'package:money_management/model/transaction.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  String type = 'exp'; // income = "inc" ,  expenditure = "exp"

  TextEditingController amountController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  showtoastmessage(String message, {required MaterialColor c}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: c,
        textColor: Colors.transparent,
        fontSize: 18.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Income / Expenditures",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: "Enter Title",
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: amountController,
              decoration: const InputDecoration(
                hintText: "Enter amount",
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Type :"),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {
                  type = "inc";
                  setState(() {});
                },
                child: Chip(
                    backgroundColor:
                        type == "inc" ? Colors.orange : Colors.blueGrey,
                    label: const Text(
                      "Income",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(
                width: 15.0,
              ),
              GestureDetector(
                onTap: () {
                  type = "exp";
                  setState(() {});
                },
                child: Chip(
                    backgroundColor:
                        type == "exp" ? Colors.orange : Colors.blueGrey,
                    label: const Text(
                      "Expenditure",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
          const SizedBox(
            width: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (amountController.text.isEmpty) {
                      showtoastmessage("Enter Valid Amount", c: Colors.amber);
                      return;
                    }
                    if (titleController.text.isEmpty) {
                      showtoastmessage("Enter Valid Title", c: Colors.cyan);
                      return;
                    }

                    dataList.add(Transaction(
                        title: titleController.text.trim(),
                        amount: double.parse(amountController.text.trim()),
                        type: type));

                    showtoastmessage("Saved!", c: Colors.green);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.tealAccent,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    width: 125,
                    child: const Center(
                        child: Text(
                      "Save",
                      style: TextStyle(fontSize: 18),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
