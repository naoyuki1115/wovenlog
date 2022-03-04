import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../constants.dart';
import '../dummy_data/like_list.dart';
import '../dummy_data/spot_list.dart';
import '../dummy_data/category_list.dart';
import '../dummy_data/selected_category_list.dart';

class SpotListScreen extends StatefulWidget {
  final String? categoryId;

  const SpotListScreen({
    Key? key,
    this.categoryId,
  }) : super(key: key);

  @override
  State<SpotListScreen> createState() => _SpotListScreenState();
}

class _SpotListScreenState extends State<SpotListScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final _spotListNotifier = Provider.of<SpotList>(context, listen: false);
      final _likeListNotifier = Provider.of<LikeList>(context, listen: false);

      //LikeListのインスタンスをSpotListクラスに渡してstate管理
      _spotListNotifier.setLikeListInstance(_likeListNotifier);
      _spotListNotifier.updateSelectedSpotList(widget.categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _spotListNotifier = Provider.of<SpotList>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _spotListNotifier.selectedCategoryName,
          style: const TextStyle(color: kFontColor),
        ),
        backgroundColor: kAppBarColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kPrimaryColor,
          ),
          //一つ前に戻る
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: kPrimaryColor,
            ),
            onPressed: () => context.push('/spot_post_screen'),
          ),
        ],
      ),
      bottomNavigationBar: const CustomButtomBar(),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SpotListView(),
        ],
      ),
    );
  }
}

//ボトムバー
class CustomButtomBar extends StatelessWidget {
  const CustomButtomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _spotListNotifier = Provider.of<SpotList>(context);
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
      currentIndex: _spotListNotifier.selectedIndex,
      items: [
        _buildBottomIcon(favoriteCats[0]),
        _buildBottomIcon(favoriteCats[1]),
        _buildBottomIcon(favoriteCats[2]),
      ],
      onTap: (index) {
        _spotListNotifier.updateSelectedSpotList(favoriteCats[index]);
        _spotListNotifier.setSelectedIndex(index);
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
    final _spotListNotifier = Provider.of<SpotList>(context);
    final _likeListInstance = Provider.of<LikeList>(context);

    return Expanded(
      child: ListView.builder(
        itemCount: _spotListNotifier.selectedSpotList.length, //リストからSpot数取得
        itemBuilder: (context, index) {
          String spotId =
              _spotListNotifier.selectedSpotList[index].id.toString();
          return Card(
            child: ListTile(
              //tileColor: Colors.blue,
              leading: SizedBox(
                width: 100,
                height: 75,
                child: Image.asset(
                  _spotListNotifier.selectedSpotList[index].image.toString(),
                ),
              ),
              title: Text(
                  _spotListNotifier.selectedSpotList[index].name.toString()),
              subtitle: Text(
                  _spotListNotifier.selectedSpotList[index].address.toString()),
              trailing: SizedBox(
                width: 90,
                child: LikeWidget(
                  userId: 'user0001',
                  spotId: spotId,
                ),
              ),
              enabled: true,
              onTap: () => context.push('/spot_detail_screen/$spotId'),
            ),
          );
        },
      ),
    );
  }
}

//いいねSection
class LikeWidget extends StatelessWidget {
  final String? userId;
  final String? spotId;
  const LikeWidget({Key? key, this.userId, this.spotId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _likeListInstance = Provider.of<LikeList>(context);
    final _spotListInstance = Provider.of<SpotList>(context);
    int _likeNums = _likeListInstance.getLikeNums(spotId);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(child: _buildLikeButton(_likeListInstance, _spotListInstance)),
        Expanded(
          child: Text(_likeNums.toString()),
        ),
      ],
    );
  }

  //Likeボタン作成
  Widget _buildLikeButton(
      LikeList _likeListInstance, SpotList _spotListInstance) {
    bool _isLikeExsited = _likeListInstance.getIsLikeExisted(userId, spotId);

    return IconButton(
      iconSize: 15,
      padding: const EdgeInsets.only(right: 8, left: 8),
      icon: (_isLikeExsited
          ? const Icon(Icons.favorite)
          : const Icon(Icons.favorite_border)),
      color: kPrimaryColor,
      onPressed: () {
        //いいね追加/削除処理
        _likeListInstance.addOrRemoveLike(userId, spotId);
        //SpotListViewの表示を更新
        _spotListInstance.setLikeListInstance(_likeListInstance);
        _spotListInstance
            .updateSelectedSpotList(_spotListInstance.getSelectedCategoryId());
      },
    );
  }
}
