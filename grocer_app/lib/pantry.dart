// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'node.dart';
import 'main.dart';

class Pantry extends StatefulWidget {
  @override
  _PantryState createState() => _PantryState();
}

class _PantryState extends State<Pantry> {
  Widget itemTemplate(pantryItems) {
    return Card(
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(pantryItems.item,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey[600],
                    )),
                SizedBox(height: 6.0),
                Text(pantryItems.subItem,
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[800]))
              ],
            )));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey[400],
        body: Column(
          children: pantryItems.map((item) => itemTemplate(item)).toList(),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add, size: 32),
            onPressed: () {
              pantryItems.add(
                  Node(item: "Empty Pantry Item", subItem: "Empty Rating"));
              setState(() {});
              //pantryItems.map((item) => itemTemplate(item)).toList();
            }),
      );
}
