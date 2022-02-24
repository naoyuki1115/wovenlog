import 'package:flutter/material.dart';
import '../screens/top_screen.dart';
import 'package:wovenlog/screens/spot_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WovenLog',
      home: SpotListScreen(),
    );
  }
}
