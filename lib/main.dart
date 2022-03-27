import 'package:flutter/material.dart';
import 'screens/preload.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda Aí IFCE',
      debugShowCheckedModeBanner: false,
      home: Preload(),
    );
  }
}