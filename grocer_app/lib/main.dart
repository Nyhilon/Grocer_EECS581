// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'pantry.dart';
import 'home.dart';
import 'recipes.dart';
import 'node.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:grocer_app/login/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:grocer_app/app/app.locator.dart';
import 'package:grocer_app/app/app.router.dart';

List<Node> pantryItems = [
  Node(item: "Empty Pantry Item", subItem: "Empty Freshness")
];

List<Node> recipeItems = [Node(item: "Empty Recipe", subItem: "Empty Rating")];

//void main() => runApp(MaterialApp(home: Home()));

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      // home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController controller;

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
        floatingActionButton: ElevatedButton(
            child: Text('Open Survey'),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                      title: Text('Survey Link'),
                      content: InkWell(
                        child: Text('https://forms.gle/NB1pN1rPhUFpQsyR9'),
                        onTap: () => launchUrl(Uri.parse(
                            'https://docs.google.com/forms/d/e/1FAIpQLSfz2UvyMQyua-mHAjwgWD-jiUZ5xmvEjofSMkLEA_YBp0UUng/viewform?usp=sf_link')),
                      )));
            }),
      );
}
