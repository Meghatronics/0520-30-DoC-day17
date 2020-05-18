import 'package:day17_30doc/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BookApp());
}

class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books by MajorE',
      home: SplashScreen(),
      theme: ThemeData.dark(),
    );
  }
}
