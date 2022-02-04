import 'dart:async';

import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:test_1/main.dart';
import 'package:test_1/Pages/page1.dart';
import 'package:test_1/Pages/page3.dart';
import 'package:timer_builder/timer_builder.dart';

class Page2 extends StatefulWidget {
  @override
  SampleAppState createState() => SampleAppState();
}

class SampleAppState extends State<Page2> {
  /* Timer? _timer;

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
    _timer = Timer(const Duration(seconds: 10), () => _handleInactivity());
  }

  void _handleInactivity() {
    _timer?.cancel();
    _timer = null;
    showAlert(context);
  }*/

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.greenAccent.shade100,
        appBar: AppBar(
          title: Text("Route transitions"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(50),
                child: Row(
                  children: <Widget>[
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(130, 40),
                            primary: Colors.purple,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        onPressed: () => slideUpWidget(
                          newPage: Dashboard(),
                          context: context,
                        ),
                        child: Text("Slide from up"),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(130, 40),
                            primary: Colors.deepOrange,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        onPressed: () => scaleWidget(
                          newPage: Dashboard(),
                          context: context,
                        ),
                        child: Text("Scale page"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  /* @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _initializeTimer(),
      onPanDown: (_) => _initializeTimer(),
      onPanUpdate: (_) => _initializeTimer(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("title"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(50),
                child: Row(
                  children: <Widget>[
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(130, 40),
                            primary: Colors.purple,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        onPressed: () => slideUpWidget(
                          newPage: Dashboard(),
                          context: context,
                        ),
                        child: Text("Slide from up"),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(130, 40),
                            primary: Colors.deepOrange,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        onPressed: () {
                          _initializeTimer();
                          scaleWidget(
                            newPage: Dashboard(),
                            context: context,
                          );
                        },
                        child: Text("Scale page"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      */
/*onTapDown: (tapDown) {
        if (timer != null) {
          timer.cancel();
        }
        timer = Timer(Duration(seconds: 10), timeOutCallBack);
      },*/ /*
    );
  }*/

  /* void timeOutCallBack() {
    showAlert(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Page3()),
    );
  }*/
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => pop(context),
          child: Text("Go back !"),
        ),
      ),
    );
  }
}
