import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(SmartClassApp());
}

class SmartClassApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Class',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
