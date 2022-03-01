import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wovenlog/constants.dart';
import 'package:wovenlog/dummy_data/spot_class.dart';
import 'package:wovenlog/dummy_data/spot_list.dart';

///test用
class SpotPostScreen extends StatelessWidget {
  const SpotPostScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _spotListInstance = Provider.of<SpotList>(context);

    return Scaffold(
      appBar: AppBar(
          title: Text(
            'post SC',//spotList[spotIndex].name,
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
      ),

      //ProviderのtestとしてSpot追加
      body: Column(children: [
        ElevatedButton(
              child: Text('SPOT追加'),
              onPressed: (){
                Spot test = Spot(
                  id: "spot0011",
                  name: "testName",
                  address: "testAddress",
                  latitude: 35.6796886,
                  longitude: 139.7678116,
                  url:
                      "https://www.google.com/maps/place/McDonald's./@35.6796886,139.7678116,15z/data=!4m9!1m2!2m1!1sMcDonald's!3m5!1s0x60188bfeba8313b7:0xf0ef793b5d8bc354!8m2!3d35.679713!4d139.7677172!15sCgpNY0RvbmFsZCdzIgOIAQFaDCIKbWNkb25hbGQnc5IBFGZhc3RfZm9vZF9yZXN0YXVyYW50",
                  image: "assets/images/spot_images/spot0001.jpg",
                  created_date: DateTime(2022, 1, 1),
                  category_id: 'category0001',
                  description: '東京駅マック',
                );

                //追加処理
                _spotListInstance.addSpot(test);
              },
      ),
              ElevatedButton(
              child: Text('category変更'),
              onPressed: (){
                //category変更処理
                _spotListInstance.narrowDownSpotListByCatsId('category0002');
              },
      ),
      ]),
    );
  }
}