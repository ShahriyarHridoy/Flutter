import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
