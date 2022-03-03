import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wovenlog/constants.dart';
import 'package:wovenlog/dummy_data/like_list.dart';
import 'package:wovenlog/dummy_data/spot_list.dart';
import 'package:wovenlog/dummy_data/category_list.dart';
import '../dummy_data/selected_category_list.dart';
import 'package:wovenlog/screens/spot_detail_screen.dart';
import 'package:wovenlog/screens/spot_post_screen.dart';

class SpotListScreen extends StatelessWidget {
  final catsId = "category0001";

  const SpotListScreen({
    Key? key,
    /*this.catsId*/
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _spotListInstance = Provider.of<SpotList>(context);

    //カテゴリIDで絞り込み
    if (_spotListInstance.isFirst) {
      _spotListInstance.narrowDownSpotListByCatsId(catsId);
      _spotListInstance.switchIsFirst();
    }
    //カテゴリIDからカテゴリ名を取得
    String catsName = _spotListInstance.getCatsName();

    return Scaffold(
        appBar: AppBar(
            title: Text(
              catsName, //"[Cats name]",
              style: TextStyle(color: kFontColor),
            ),
            backgroundColor: kAppBarColor,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: kPrimaryColor,
              ),
              //一つ前に戻る
              onPressed: () => {Navigator.pop(context)},
            ),
            actions: [
              IconButton(
                  icon: const Icon(
                    Icons.add,
                    color: kPrimaryColor,
                  ),
                  onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SpotPostScreen()),
                        )
                      }),
            ]),
        bottomNavigationBar: CustomButtomBar(),
        body: Column(children: [
          SizedBox(
            height: 10,
          ),
          SpotListView(),
        ]));
  }

  //ボトムバーに表示するアイコンを定義
  BottomNavigationBarItem _buildBottomIcon(int _catsIndex) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        child: Image.asset(categoryList[_catsIndex].icon),
        height: 25,
        width: 25,
      ),
      label: categoryList[_catsIndex].name,
    );
  }
}

class CustomButtomBar extends StatelessWidget {
  const CustomButtomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _spotListInstance = Provider.of<SpotList>(context);
    final _selectedCategoryList = Provider.of<SelectedCategoryList>(context);

    //表示するカテゴリID（上位3つ）
    String? _firstCatsId =
        _selectedCategoryList.selectedCategoryList[0].categoryId;
    String? _secondCatsId =
        _selectedCategoryList.selectedCategoryList[1].categoryId;
    String? _thirdCatsId =
        _selectedCategoryList.selectedCategoryList[2].categoryId;

    //表示するカテゴリIDリスト化（上位3つ）
    List favoriteCats = [
      _firstCatsId,
      _secondCatsId,
      _thirdCatsId,
    ];

    return BottomNavigationBar(
      backgroundColor: kAppBarColor,
      unselectedItemColor: kBackgroundColor,
      selectedItemColor: kPrimaryColor,
      items: [
        _buildBottomIcon(favoriteCats[0]), //(_firstCatsId),
        _buildBottomIcon(favoriteCats[1]),
        _buildBottomIcon(favoriteCats[2]),
      ],
      onTap: (index) {
        _spotListInstance.narrowDownSpotListByCatsId(favoriteCats[index]);
        //_spotListInstance.getCatsSpotList();
      },
    );
  }

  //ボトムバーに表示するアイコンを定義
  BottomNavigationBarItem _buildBottomIcon(_catsId) {
    int _catsIndex =
        categoryList.indexWhere((element) => element.id == _catsId);
    return BottomNavigationBarItem(
      icon: SizedBox(
        child: Image.asset(categoryList[_catsIndex].icon),
        height: 25,
        width: 25,
      ),
      label: categoryList[_catsIndex].name,
    );
  }
}

//Spot一覧をカード表示
class SpotListView extends StatelessWidget {
  SpotListView({
    Key? key,
  }) : super(key: key);

  bool _isLiked = false;
  int likeNum = 0;

  @override
  Widget build(BuildContext context) {
    final _spotListInstance = Provider.of<SpotList>(context);

    //カテゴリIDと一致するSpotに絞り込み
    _spotListInstance.upadateCatsSpotList();
    List oneCatsSpotList = _spotListInstance.getCatsSpotList();

    return Expanded(
      child: ListView.builder(
          itemCount: oneCatsSpotList.length, //リストからSpot数取得
          itemBuilder: (context, index) {
            String spotId = oneCatsSpotList[index].id.toString();
            return Card(
              child: ListTile(
                  //tileColor: Colors.blue,
                  leading: Container(
                      width: 100,
                      height: 75,
                      child:
                          Image.asset(oneCatsSpotList[index].image.toString())),
                  title: Text(oneCatsSpotList[index]
                      .name
                      .toString()), //spotList[index].name),
                  subtitle: Text(oneCatsSpotList[index].address.toString()),
                  trailing: SizedBox(
                    width: 90,
                    child: LikeWidget(
                      userId: 'user0001',
                      spotId: spotId,
                    ),
                  ), //LikeWidget(),//Icon(Icons.more_vert),
                  enabled: true,
                  onTap: () {
                    // String spotId = oneCatsSpotList[index].id.toString();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SpotDetailScreen(spotId: spotId)),
                    );
                  }),
            );
          }),
    );
  }
}

class LikeWidget extends StatelessWidget {
  final userId;
  final spotId;
  const LikeWidget({Key? key, this.userId, this.spotId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _likeListInstance = Provider.of<LikeList>(context);
    int _likeNums = _likeListInstance.getLikeNums(spotId);

    return Container(
        //padding: EdgeInsets.only(right: 12, left: 12),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Expanded(child: _buildLikeButton(_likeListInstance)),
      Expanded(
        child: Text(_likeNums.toString()),
      ),
    ]));
  }

  //Likeボタン作成
  Widget _buildLikeButton(LikeList _likeListInstance) {
    bool _isLikeExsited = _likeListInstance.getIsLikeExisted(userId, spotId);

    return IconButton(
        iconSize: 15,
        padding: const EdgeInsets.only(right: 8, left: 8),
        icon: (_isLikeExsited
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border)),
        color: kPrimaryColor,
        onPressed: () {
          DateTime _createdDate = DateTime.now();
          _likeListInstance.addOrRemoveLike(userId, spotId, _createdDate);
        });
  }
}
