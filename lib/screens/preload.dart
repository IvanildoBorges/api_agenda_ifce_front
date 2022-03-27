import 'dart:async';
import 'package:flutter/material.dart';

import 'package:agenda_ai_ifce/screens/home.dart';

class Preload extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PreloadState();
  }
}

class PreloadState extends State<Preload> {

  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(
        const Duration(seconds: 3),
            () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home()),
                  (Route<dynamic> route) => false
          );
        }
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Preload.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("AGENDA AÍ IFCE",
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }}