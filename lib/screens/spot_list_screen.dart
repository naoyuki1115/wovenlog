import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../screens/spot_post_screen.dart';
import '../screens/spot_detail_screen.dart';
import '../dummy_data/like_list.dart';
import '../dummy_data/spot_list.dart';
import '../dummy_data/category_list.dart';
import '../dummy_data/selected_category_list.dart';

class SpotListScreen extends StatefulWidget {
  // final catsId = "category0001";
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
      final _spotListNoifier = Provider.of<SpotList>(context, listen: false);
      _spotListNoifier.updateSelectedSpotList(widget.categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _spotListNotifier = Provider.of<SpotList>(context);

    return Scaffold(
        appBar: AppBar(
            title: Text(
              _spotListNotifier.selectedCategoryName, //"[Cats name]",
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
                          MaterialPageRoute(builder: (context) => SpotPostScreen()),
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
}

class CustomButtomBar extends StatelessWidget {
  const CustomButtomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _spotListNotifier = Provider.of<SpotList>(context);
    final _selectedCategoryList = Provider.of<SelectedCategoryList>(context);

    //表示するカテゴリID（上位3つ）
    String? _firstCatsId = _selectedCategoryList.selectedCategoryList[0].categoryId;
    String? _secondCatsId = _selectedCategoryList.selectedCategoryList[1].categoryId;
    String? _thirdCatsId = _selectedCategoryList.selectedCategoryList[2].categoryId;

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
        _buildBottomIcon(favoriteCats[0]), //(_firstCatsId),
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
    int _catsIndex = categoryList.indexWhere((element) => element.id == _catsId);
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
  const SpotListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _spotListNotifier = Provider.of<SpotList>(context);

    print('build spot list view');

    return Expanded(
      child: ListView.builder(
          itemCount: _spotListNotifier.selectedSpotList.length, //リストからSpot数取得
          itemBuilder: (context, index) {
            String spotId = _spotListNotifier.selectedSpotList[index].id.toString();
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
                  title: Text(_spotListNotifier.selectedSpotList[index].name.toString()), //spotList[index].name),
                  subtitle: Text(_spotListNotifier.selectedSpotList[index].address.toString()),
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
                      MaterialPageRoute(builder: (context) => SpotDetailScreen(spotId: spotId)),
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
        icon: (_isLikeExsited ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border)),
        color: kPrimaryColor,
        onPressed: () {
          DateTime _createdDate = DateTime.now();
          _likeListInstance.addOrRemoveLike(userId, spotId, _createdDate);
        });
  }
}
