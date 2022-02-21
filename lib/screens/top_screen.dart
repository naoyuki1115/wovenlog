import 'package:flutter/material.dart';
import 'package:wovenlog/dummy_data/category_list.dart';

class TopScreen extends StatelessWidget {
  // const TopScreen({Key? key}) : super(key: key);

  final List<IconData> icons = [
    Icons.access_alarm,
    Icons.arrow_back_ios,
    Icons.account_balance_wallet,
    Icons.center_focus_weak,
    Icons.blur_on,
    Icons.dashboard,
    Icons.phone,
    Icons.tap_and_play,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 10,
        itemBuilder: ((context, index) => Card(
              color: Colors.amber,
              child: Column(
                children: [
                  ImageIcon(
                    AssetImage("assets/icons/icon_park.png"),
                    color: Colors.red,
                    size: 40,
                  ),

                  // Center(child: Text('$index')),
                ],
              ),
            )),
      ),
    );
  }
}
