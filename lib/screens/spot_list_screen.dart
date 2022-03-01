import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wovenlog/constants.dart';
import 'package:wovenlog/dummy_data/spot_list.dart';
import 'package:wovenlog/dummy_data/category_list.dart';
import '../dummy_data/selected_category_list.dart';
import 'package:wovenlog/screens/spot_detail_screen.dart';

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
    //_spotListInstance.narrowDownSpotListByCatsId(catsId);

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
          // Consumer(builder:(BuildContext context, value, child){
          //   return SpotListView();
          // }),
        ]));
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

    //表示するカテゴリID（上位3つ）
    List favoriteCats = [
      _firstCatsId,
      _secondCatsId,
      _thirdCatsId,
    ];

    // void _switchCats(){
    // }

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
  const SpotListView({
    Key? key,
  }) : super(key: key);

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
                      child:
                          LikeWidget()), //LikeWidget(),//Icon(Icons.more_vert),
                  enabled: true,
                  onTap: () {
                    String spotId = oneCatsSpotList[index].id.toString();
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

// Like widget作成（Statefull App)
// make Widget
class LikeWidget extends StatefulWidget {
  const LikeWidget({Key? key}) : super(key: key);
  @override
  State<LikeWidget> createState() => LikeWidget_State();
}

class _SpotListScreen extends State<SpotListScreen> {
  final _controller = TextEditingController();
  String? _inputSpotId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
      ),
      body: Column(
        children: <Widget>[
          Text('入力フォーム'),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          TextField(
            controller: _controller,
            onChanged: changeTextField,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              child: Text('送信'),
              onPressed: () {
                if (_inputSpotId!.isEmpty) {
                  return;
                } else {
                  /// 3. Navigator.push で遷移する際に渡す値を指定する
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            SpotDetailScreen(spotId: _inputSpotId)),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void changeTextField(String value) {
    _inputSpotId = value;
  }
}
