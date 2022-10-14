import 'package:flutter/material.dart';

class EntryCard extends StatelessWidget {
  final String title;
  final String amount;
  final String type;

  const EntryCard(
      {Key? key, required this.title, required this.amount, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Card(
        color: Colors.tealAccent.shade100,
        shadowColor: Colors.blueGrey,
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        elevation: 12.0,
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          trailing: Text(
            type == "inc" ? amount : " - $amount",
            style: TextStyle(
                fontSize: 20, color: type == "inc" ? Colors.green : Colors.red),
          ),
        ),
      ),
    );
  }
}
