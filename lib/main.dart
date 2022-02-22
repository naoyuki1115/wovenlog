import 'package:flutter/material.dart';
import 'package:wovenlog/screens/login_screen.dart';
import '../screens/top_screen.dart';
import '../screens/top_edit_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WovenLog',
      home: LoginScreen(),
      //home: TopEditScreen(),
    );
  }
}
