// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import other files from throughout the project
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

// global level list of nodes for storing user pantry items
List<Node> pantryItems = [
  Node(item: "Empty Pantry Item", subItem: "Empty Freshness")
];

// global level list of nodes for storing recipes
List<Node> recipeItems = [Node(item: "Empty Recipe", subItem: "Empty Rating")];

//void main() => runApp(MaterialApp(home: Home()));

// primary driver that kicks everything off
Future main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // ensures initial widget gets created
  await Firebase.initializeApp(); // wait for firebase backend to catchup
  setupLocator();
  runApp(MyApp()); // pass controll off
}

// high level widget, every other widget resides in this one
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // title text
      theme: ThemeData(
        primarySwatch: Colors.blue, // set theme primary color
        visualDensity: VisualDensity
            .adaptivePlatformDensity, // sets the theme to be adapatable
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      home: MainPage(), // move control over to the home widget
    );
  }
}

// initializer for the MainPage widget, passes controll immediately to the other MainPage widget class
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

// this is what displays when the user is on the home tab
class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController
      controller; // initialize tab controller for parity between pages

  // sets the initial state of the home tab
  @override
  void initState() {
    super.initState();

    controller =
        TabController(length: 3, vsync: this); // length is number of tabs
    controller.addListener(() {
      // knows to listen for user input when the state changes
      setState(() {});
    });
  }

  // destructor
  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  // builds the actual visual side of the home page
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          // AppBar sets the visuals for the tab controller
          title: controller.index ==
                  0 // set the index of the controller to have the text of the corresponding tab
              ? Text('Pantry')
              : controller.index == 1
                  ? Text('Home')
                  : controller.index == 2
                      ? Text('Recipes')
                      : Text('ERROR'),
          centerTitle: true, // sets the text to be centered on the top title
          bottom: TabBar(
            // visual for the actual tabs
            controller: controller,
            tabs: [
              // sets the icon for each index of the array
              Tab(icon: Icon(Icons.shopping_basket_outlined)),
              Tab(icon: Icon(Icons.home_outlined)),
              Tab(icon: Icon(Icons.book_outlined)),
            ],
          ),
        ),
        body: TabBarView(controller: controller, children: [
          // sets the body of each tab to the correct page
          Pantry(),
          Home(),
          Recipes(),
        ]),
        floatingActionButton: ElevatedButton(
            // bones of the survey button, not needed later
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
