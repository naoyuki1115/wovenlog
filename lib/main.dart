import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../screens/top_screen.dart';
import '../screens/top_screen2.dart';
// import '../screens/top_edit_screen.dart';
import '../screens/top_edit_screen2.dart';
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
        home: TopScreen(),
      ),
      providers: [
        ChangeNotifierProvider(
          create: (context) => SelectedCategoryList(),
        )
      ],
    );
  }
}
