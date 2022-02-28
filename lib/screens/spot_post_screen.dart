import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:wovenlog/constants.dart';

///test用
class SpotPostScreen extends StatelessWidget {
  const SpotPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(
        'post SC', //spotList[spotIndex].name,
        style: TextStyle(color: kFontColor),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: kPrimaryColor,
        ),
        //一つ前に戻る
        onPressed: () => context.pop(),
      ),
    ));
  }
}
