import 'package:flutter/material.dart';
import 'package:wovenlog/constants.dart';

class SpotListScreen extends StatelessWidget {
  const SpotListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "[Cats name]",
          style: TextStyle(color: kFontColor),
        ),
        backgroundColor: kAppBarColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kPrimaryColor,),
          onPressed: () => {Navigator.pop(context)},
        ),
      )
    );
  }
}
