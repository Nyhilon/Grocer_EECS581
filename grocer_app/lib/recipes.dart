// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'node.dart';
import 'main.dart';

class Recipes extends StatefulWidget {
  @override
  _RecipesState createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  Widget itemTemplate(recipeItems) {
    return Card(
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(recipeItems.item,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey[600],
                    )),
                SizedBox(height: 6.0),
                Text(recipeItems.subItem,
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[800]))
              ],
            )));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey[400],
        body: Column(
          children: recipeItems.map((item) => itemTemplate(item)).toList(),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add, size: 32),
            onPressed: () {
              recipeItems
                  .add(Node(item: "Empty Recipe", subItem: "Empty Rating"));
              setState(() {});
              //recipeItems.map((item) => itemTemplate(item)).toList();
            }),
      );
}
