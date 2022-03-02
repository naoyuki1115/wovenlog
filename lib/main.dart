import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import './screens/login_screen.dart';
import './screens/top_screen.dart';
import './screens/top_edit_screen.dart';
// TODO:
import './screens/spot_list_screen_toyama.dart';
import './screens/spot_detail_screen.dart';
import './screens/spot_post_screen.dart';
import './dummy_data/selected_category_list.dart';
import './dummy_data/spot_list_notifier.dart';
import './dummy_data/like_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/top_screen',
        builder: (context, state) => const TopScreen(),
      ),
      GoRoute(
        path: '/top_edit_screen',
        builder: (context, state) => const TopEditScreen(),
      ),
      GoRoute(
        // path: '/spot_list_screen',
        // builder: (context, state) => const SpotListScreen(),
        path: '/spot_list_screen/:categoryId',
        builder: (context, state) => SpotListScreen(categoryId: state.params['categoryId']!),
      ),
      GoRoute(
        path: '/spot_detail_screen/:spotId',
        builder: (context, state) => SpotDetailScreen(spotId: state.params['spotId']!),
      ),
      GoRoute(
        path: '/spot_post_screen',
        builder: (context, state) => const SpotPostScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      ),
      providers: [
        ChangeNotifierProvider(
          create: (context) => SelectedCategoryList(),
        ),
        ChangeNotifierProvider(
          create: (context) => SpotListNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => LikeList(),
        ),
      ],
    );
  }
}
