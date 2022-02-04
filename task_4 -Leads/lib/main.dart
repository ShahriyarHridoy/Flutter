import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_1/Pages/page1.dart';
import 'package:test_1/Pages/page2.dart';
import 'package:test_1/Pages/page3.dart';
import 'package:test_1/Pages/page4.dart';
import 'package:test_1/Pages/page5.dart';

import 'Utilities/theme_Item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Switching themes like a fox",
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  //final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/*class _MyHomePageState extends State<MyHomePage> {
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
}*/
class _MyHomePageState extends State<MyHomePage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  //GlobalKey<NavigatorState> _bottomNavigationKey = GlobalKey<NavigatorState>();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _initializeTimer();
  }

  // start/restart timer
  void _initializeTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    // setup action after 5 minutes
    _timer = Timer(const Duration(minutes: 10), () => _handleInactivity());
  }

  void _handleInactivity() {
    _timer?.cancel();
    _timer = null;
    showAlert(context);
    /*Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Page3()),
    );*/
  }

  List<Widget> _listPages = [
    Page1(),
    Page2(),
    Page3(),
    Page4(),
    Page5(),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _initializeTimer(),
      onPanDown: (_) => _initializeTimer(),
      onPanUpdate: (_) => _initializeTimer(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
              key: _bottomNavigationKey,
              index: 0,
              height: 50.0,
              items: <Widget>[
                Icon(Icons.add, size: 30),
                Icon(Icons.list, size: 30),
                Icon(Icons.compare_arrows, size: 30),
                Icon(Icons.call_split, size: 30),
                Icon(Icons.perm_identity, size: 30),
              ],
              color: Colors.white,
              buttonBackgroundColor: Colors.white,
              backgroundColor: Colors.blueAccent,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 600),
              onTap: (index) {
                //_bottomNavigationKey.currentState!.maybePop();
                setState(() {
                  _page = index;
                });
              },
            ),
            body: _listPages[_page]),
      ),
    );
  }

  void showAlert(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
      (Route<dynamic> route) => false,
    );
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        title: Center(
          child: Text("Log In Again"),
        ),
        //insetPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.08),
        content: SingleChildScrollView(
          child: Container(
            //padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  //height: 16,
                  width: MediaQuery.of(context).size.width,
                ),
                Center(
                    child: Text("Your Session is expired",
                        style: GoogleFonts.lobster(
                          fontSize: 25,
                          color: Colors.deepOrange,
                          //fontWeight: FontWeight.bold,
                        ))),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            child: Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
