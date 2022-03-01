import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wovenlog/screens/spot_post_screen.dart';

import '../screens/login_screen.dart';
import '../screens/top_screen.dart';
import '../dummy_data/selected_category_list.dart';
import 'screens/spot_detail_screen.dart';
import 'screens/spot_list_screen.dart';

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
        home: SpotPostScreen(),
      ),
      providers: [
        ChangeNotifierProvider(
          create: (context) => SelectedCategoryList(),
        )
      ],
    );
  }
}
