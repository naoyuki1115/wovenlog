import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wovenlog/dummy_data/spot_list.dart';

import '../screens/login_screen.dart';
import '../screens/top_screen.dart';
import 'package:wovenlog/screens/spot_list_screen.dart';
import '../dummy_data/selected_category_list.dart';
import 'screens/spot_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        title: 'WovenLog',
        home: SpotDetailScreen(),
      ),
      providers: [
        ChangeNotifierProvider(
          create: (context) => SelectedCategoryList(),
        ),
        ChangeNotifierProvider(
          create: (context) => SpotList(),
        ),
      ],
    );
  }
}
