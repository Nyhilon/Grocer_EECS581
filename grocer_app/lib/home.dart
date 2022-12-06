// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'node.dart';
import 'main.dart';

// constructor for the stateful home widget
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  final itemController = TextEditingController();
  final subItemController = TextEditingController();

  Widget itemTemplate(recipeItems) {
    return GestureDetector(
        onTap: () => showDialog(
              // gives functionality when the recipes are tapped
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Stack(
                    children: <Widget>[
                      Positioned(
                        right: -40.0,
                        top: -40.0,
                        child: InkResponse(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: CircleAvatar(
                            child: Icon(Icons.close),
                            backgroundColor: Colors.red,
                          ),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(controller: itemController),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: subItemController,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    recipeItems.item = itemController.text;
                                    recipeItems.subItem =
                                        subItemController.text;
                                    setState(() {});
                                  },
                                  child: const Text("Submit"),
                                  //onPressed: () {}
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
        child: Card(
            // sets the text and style of the recipe cards
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
                        style:
                            TextStyle(fontSize: 14.0, color: Colors.grey[800]))
                  ],
                ))));
  }

  // functions gets called when the new recipe button gets pressed, initializes new node in recipe array
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
