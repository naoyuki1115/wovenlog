import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/spot_post_screen_toyama.dart';
import '../dummy_data/selected_category_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: const MaterialApp(
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
