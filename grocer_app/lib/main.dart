// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'pantry.dart';
import 'home.dart';
import 'recipes.dart';
import 'node.dart';

List<Node> pantryItems = [
  Node(item: "Empty Pantry Item", subItem: "Empty Rating")
];

List<Node> recipeItems = [
  Node(item: "Empty Pantry Item", subItem: "Empty Rating")
];

void main() => runApp(MaterialApp(home: MainPage()));

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 3, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: controller.index == 0
              ? Text('Pantry')
              : controller.index == 1
                  ? Text('Home')
                  : controller.index == 2
                      ? Text('Recipes')
                      : Text('ERROR'),
          centerTitle: true,
          bottom: TabBar(
            controller: controller,
            tabs: [
              Tab(icon: Icon(Icons.shopping_basket_outlined)),
              Tab(icon: Icon(Icons.home_outlined)),
              Tab(icon: Icon(Icons.book_outlined)),
            ],
          ),
        ),
        body: TabBarView(controller: controller, children: [
          Pantry(),
          Home(),
          Recipes(),
        ]),
      );
}
