import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
<<<<<<< HEAD
||||||| 69e451f
import 'package:wovenlog/screens/spot_post_screen.dart';
=======

>>>>>>> 34c3a56ec4f215777a2595fb8b2115b204b5a699

import '../screens/login_screen.dart';
import '../screens/top_screen.dart';
import '../screens/spot_detail_screen.dart';
import 'package:wovenlog/screens/spot_list_screen.dart';

import '../dummy_data/selected_category_list.dart';
import 'package:wovenlog/dummy_data/spot_list.dart';
import 'package:wovenlog/dummy_data/like_list.dart';


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
<<<<<<< HEAD
        home: TopScreen(),
||||||| 69e451f
        home: SpotPostScreen(),
=======
        home: SpotListScreen(), //TopScreen(),
>>>>>>> 34c3a56ec4f215777a2595fb8b2115b204b5a699
      ),
      providers: [
        ChangeNotifierProvider(
          create: (context) => SelectedCategoryList(),
        ),
        ChangeNotifierProvider(
          create: (context) => SpotList(),
        ),
        ChangeNotifierProvider(
          create: (context) => LikeList(),
        ),
      ],
    );
  }
}
