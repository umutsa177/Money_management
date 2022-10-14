import 'package:flutter/material.dart';
import 'package:money_management/model/data.dart';
import 'package:money_management/screens/add_data.dart';
import 'package:money_management/ui/entry_card.dart';
import 'package:money_management/ui/total_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double totalIncome = 0;
  double totalExpenditure = 0;
  double totalBalance = 0;

  calculate() {
    for (var element in dataList) {
      if (element.type == "inc") {
        totalIncome += element.amount;
      } else {
        totalExpenditure += element.amount;
      }

      setState(() {
        totalBalance = totalIncome - totalExpenditure;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    calculate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent.shade400,
        leading: InkWell(
          child: const Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.payment),
          ),
        ],
        title: titleText("Money Manager"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddData()));
        },
        elevation: 16.0,
        backgroundColor: Colors.deepOrangeAccent.shade400,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                    child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.orangeAccent,
                        ),
                        child: TotalBox(
                            title: "Balance", amount: "$totalBalance"))),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                  child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.limeAccent.shade400,
                      ),
                      child:
                          TotalBox(title: "Income", amount: "$totalIncome"))),
              Center(
                  child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.purpleAccent.shade700,
                      ),
                      child: TotalBox(
                          title: "Expenditure", amount: "$totalExpenditure"))),
            ],
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () {
                calculate();
                return Future.delayed(const Duration(seconds: 1));
              },
              child: ListView.builder(
                itemCount: dataList.length,
                itemBuilder: ((context, index) => EntryCard(
                    title: dataList[index].title,
                    amount: dataList[index].amount.toString(),
                    type: dataList[index].type)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

titleText(String titleText) {
  return Text(
    titleText,
    style: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: 25,
    ),
  );
}
