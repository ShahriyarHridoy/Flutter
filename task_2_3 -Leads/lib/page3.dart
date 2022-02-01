import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
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
              //margin: EdgeInsets.all(50),
              child: Column(
                children: <Widget>[
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(130, 40),
                          primary: Colors.purple,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          textStyle: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                      onPressed: () => pushWidget(
                        newPage: Dashboard(),
                        context: context,
                      ),
                      child: Text("Push page"),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(180, 40),
                          primary: Colors.deepOrange,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          textStyle: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                      onPressed: () => customAnimationWidget(
                        newPage: Dashboard(),
                        context: context,
                        transitionBuilder:
                            (context, animation, secondaryAnimation, child) {
                          var begin = 0.0;
                          var end = 1.0;
                          var curve = Curves.easeIn;

                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));

                          return ScaleTransition(
                            scale: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                      child: Text("Custom animation"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
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
