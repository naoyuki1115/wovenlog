import 'package:flutter/material.dart';
import 'package:wovenlog/constants.dart';
import 'package:wovenlog/dummy_data/spot_list.dart';

///test用
class SpotDetailScreen extends StatelessWidget {
  //const SpotDetailScreen({ Key? key }) : super(key: key);
  final spotIndex;

  const SpotDetailScreen({
    Key? key,
    this.spotIndex,
  }) : super(key: key);

  //const SpotDetailScreen({this.spotIndex,});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            spotList[spotIndex].name,
            style: TextStyle(color: kFontColor),
          ),
      )
    );
  }
}
///
///
