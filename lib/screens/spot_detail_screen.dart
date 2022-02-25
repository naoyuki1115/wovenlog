import 'package:flutter/material.dart';
import 'package:wovenlog/constants.dart';
import 'package:wovenlog/dummy_data/spot_list.dart';

///test用
class SpotDetailScreen extends StatelessWidget {
  //const SpotDetailScreen({ Key? key }) : super(key: key);
  final spotId;

  const SpotDetailScreen({
    Key? key,
    this.spotId,
  }) : super(key: key);

  //const SpotDetailScreen({this.spotIndex,});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            spotId,//spotList[spotIndex].name,
            style: TextStyle(color: kFontColor),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: kPrimaryColor,
            ),
            //一つ前に戻る
            onPressed: () => {Navigator.pop(context)},
          ),
      )
    );
  }
}
///
///
