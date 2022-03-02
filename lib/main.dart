import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../screens/login_screen.dart';
import '../screens/top_screen.dart';
<<<<<<< HEAD
||||||| 410751d
import 'package:wovenlog/screens/spot_list_screen.dart';
=======
import '../screens/spot_detail_screen.dart';
import 'package:wovenlog/screens/spot_list_screen.dart';

>>>>>>> 1d17a9d204abdb5bc9c6eebce730f60fd9541055
import '../dummy_data/selected_category_list.dart';
<<<<<<< HEAD
import './screens/spot_post_screen.dart';
import './dummy_data/spot_list_provider.dart';
import './dummy_data/selected_category_list.dart';
||||||| 410751d
import 'screens/spot_detail_screen.dart';
=======
import 'package:wovenlog/dummy_data/spot_list.dart';
import 'package:wovenlog/dummy_data/like_list.dart';

>>>>>>> 1d17a9d204abdb5bc9c6eebce730f60fd9541055

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
        home: SpotPostScreen(),
||||||| 410751d
        home: SpotDetailScreen(),
=======
        home: SpotListScreen(), //TopScreen(),
>>>>>>> 1d17a9d204abdb5bc9c6eebce730f60fd9541055
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
