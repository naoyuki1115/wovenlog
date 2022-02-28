import 'package:flutter/material.dart';
import 'package:wovenlog/screens/spot_list_screen.dart';

import '../constants.dart';
import '../dummy_data/category_list.dart';
import '../dummy_data/spot_list.dart';
// import '../generated_plugin_registrant.dart';

class SpotDetailScreen extends StatelessWidget {
  //前ページから受け取ったSPOTのID
  // final String _inputSpotId;
  // SpotDetailScreen(this._inputSpotId);

  // List _selectedSpotList =
  //     spotList.where((_shop) => _shop.id == _inputSpotId).toList();

  // String _spotName = _selectedSpotList[0].name;
  // String _spotImage = _selectedSpotList[0].image;

  // String _selectedCategory_id = _selectedSpotList[0].category_id;
  // List _spotCategory = categoryList
  //     .where((_category) => _category.id == _selectedCategory_id)
  //     .toList()[0]
  //     .name;

  // String _spotUrl = _selectedSpotList[0].url;
  // String _spotDescription = _selectedSpotList[0].description;

  // / 2. 引数受け取り用にinputStringの引数を指定したコンストラクタを書く

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Post',
          style: TextStyle(
              fontSize: 20, color: kFontColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kAppBarColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: kPrimaryColor),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => SpotListScreen()),
            );
          },
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              // Spot画像//////////////////
              SizedBox(
                height: 403,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/woven_city_vertical.jpeg',
                  fit: BoxFit.fill,
                ),
              ),
              // Spot名//////////////////
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                child: Text(
                  "sss",
                  style: const TextStyle(fontSize: 20, color: kFontColor),
                ),
              ),
              // Category名//////////////////
              SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          color: Colors.red,
                          child: const Text(
                            "・Category",
                            style: TextStyle(fontSize: 20, color: kFontColor),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          alignment: Alignment.centerLeft,
                          color: Colors.grey,
                          child: Text(
                            "bbb",
                            style: const TextStyle(
                                fontSize: 20, color: kFontColor),
                          ),
                        ),
                      ),
                    ],
                  )),
              // URL　//////////////////
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        alignment: Alignment.centerLeft,
                        color: Colors.red,
                        child: const Text(
                          "・URL",
                          style: TextStyle(fontSize: 20, color: kFontColor),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        alignment: Alignment.centerLeft,
                        color: Colors.grey,
                        child: Text(
                          "ddd",
                          style:
                              const TextStyle(fontSize: 20, color: kFontColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Description//////////////////
              SizedBox(
                height: 50,
                child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 10),
                    alignment: Alignment.centerLeft,
                    color: Colors.blue,
                    child: const Text(
                      "・Description",
                      style: TextStyle(fontSize: 20, color: kFontColor),
                    )),
              ),
              // 詳細コメント欄//////////////////
              SizedBox(
                height: 165,
                child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 10),
                    alignment: Alignment.topLeft,
                    color: Colors.grey,
                    child: Text(
                      "fff",
                      style: const TextStyle(fontSize: 20, color: kFontColor),
                    )),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
