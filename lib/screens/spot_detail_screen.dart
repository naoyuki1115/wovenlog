import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../constants.dart';
import '../dummy_data/category_list.dart';
import '../dummy_data/spot_list.dart';

class SpotDetailScreen extends StatelessWidget {
  final String? spotId;

  const SpotDetailScreen({
    Key? key,
    this.spotId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _spotListInstance = Provider.of<SpotList>(context);
    // 前画面から渡されたSpotIdと一致するSpotを抽出
    final _selectedSpot = _spotListInstance.getSpotInfo(spotId);
    //抽出したSpotのCategoruIdと一致するカテゴリー名をcategoryListから抽出
    final _selectedCats = categoryList.singleWhere((element) => element.id == _selectedSpot.categoryId);

    // var _getSpotId = getSpotId(spotId);
    return MaterialApp(
      title: 'spot_detail_screen',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            _selectedSpot.name.toString(),
            style: const TextStyle(
              fontSize: 20,
              color: kFontColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: kAppBarColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: kPrimaryColor,
            ),
            onPressed: () => context.pop(),
          ),
        ),
        body: Column(
          children: [
            // 画像表示
            Container(
              height: 390,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(_selectedSpot.image.toString()),
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              // Spot名表示
              height: 45,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 5, left: 5),
              child: Text(
                _selectedSpot.name.toString(),
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Container(
              // カテゴリー表示
              height: 45,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(right: 5, left: 5),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "・Category",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      _selectedCats.name,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // URL表示
              height: 45,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(right: 5, left: 5),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "・URL",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      _selectedSpot.url.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 45,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(right: 5, left: 5),
              child: const Text(
                "・Description",
                style: TextStyle(fontSize: 20),
              ),
            ),
            // Description表示
            Container(
              height: 150,
              width: double.infinity,
              margin: const EdgeInsets.only(right: 25, left: 25),
              child: Text(
                _selectedSpot.description.toString(),
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
