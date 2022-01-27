import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_1/page1.dart';
import 'package:test_1/page2.dart';
import 'package:test_1/page3.dart';
import 'package:test_1/page4.dart';
import 'package:test_1/page5.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Check 1'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            title: Text('Check 2'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text('Check 3'),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Page1(),
              );
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Page2(),
              );
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Page3(),
              );
            });
          default:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Page1(),
              );
            });
        }
      },
    );
  }
}
