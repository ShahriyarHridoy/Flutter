import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            color: Colors.blueAccent,
            child: Text(
              "This is Page 4",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
