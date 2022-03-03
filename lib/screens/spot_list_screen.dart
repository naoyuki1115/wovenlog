import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:wovenlog/constants.dart';
import 'package:wovenlog/dummy_data/spot_list.dart';
import 'package:wovenlog/dummy_data/category_list.dart';
||||||| 69e451f
=======
import 'package:provider/provider.dart';
import 'package:wovenlog/constants.dart';
import 'package:wovenlog/dummy_data/like_list.dart';
import 'package:wovenlog/dummy_data/spot_list.dart';
import 'package:wovenlog/dummy_data/category_list.dart';
import '../dummy_data/selected_category_list.dart';
>>>>>>> 34c3a56ec4f215777a2595fb8b2115b204b5a699
import 'package:wovenlog/screens/spot_detail_screen.dart';
import 'package:wovenlog/screens/spot_post_screen.dart';

<<<<<<< HEAD
class SpotListScreen extends StatelessWidget {
  const SpotListScreen({Key? key}) : super(key: key);
||||||| 69e451f
void main() => runApp(MyApp());
=======
class SpotListScreen extends StatelessWidget {
  final catsId = "category0001";
>>>>>>> 34c3a56ec4f215777a2595fb8b2115b204b5a699

<<<<<<< HEAD
  @override
  Widget build(BuildContext context) {
    
    final catsId = "category0001";
    String catsName = categoryList.where((_list) => _list.id == catsId).toList()[0].name.toString();  

    return Scaffold(
        appBar: AppBar(
          title: Text(
            catsName,//"[Cats name]",
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
          actions:[
            IconButton(
            icon: const Icon(
              Icons.add,
              color: kPrimaryColor,
            ),
            onPressed: () => {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SpotPostScreen()),
            )}
          ),]
        ),
        
        bottomNavigationBar: CustomButtomBar(),

        body: Column(children: [
          SizedBox(height: 10,),
          SpotListView(catsId:catsId),
        ]));
  }
}

class CustomButtomBar extends StatelessWidget {
  const CustomButtomBar({Key? key,}) : super(key: key);
||||||| 69e451f
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
=======
  const SpotListScreen({
    Key? key,
    /*this.catsId*/
  }) : super(key: key);
>>>>>>> 34c3a56ec4f215777a2595fb8b2115b204b5a699

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    
    //表示するカテゴリindex番号（サンプル）
    int _firstCats = 0;
    int _secondCats = 3;
    int _thirdCats = 5;
    
    return BottomNavigationBar(
      backgroundColor: kAppBarColor,
      unselectedItemColor: kBackgroundColor,
      selectedItemColor: kPrimaryColor,
      items: [
        _buildBottomIcon(_firstCats),
        _buildBottomIcon(_secondCats),
        _buildBottomIcon(_thirdCats),
      ],
||||||| 69e451f
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Navigator App',
      home: SpotListScreen(),
=======
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
        ])
>>>>>>> 34c3a56ec4f215777a2595fb8b2115b204b5a699
    );
  }

  //ボトムバーに表示するアイコンを定義
  BottomNavigationBarItem _buildBottomIcon(int _catsIndex){
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

<<<<<<< HEAD
//Spot一覧をカード表示
class SpotListView extends StatelessWidget {
  final catsId;

  const SpotListView({Key? key, this.catsId}) : super(key: key);
  
||||||| 69e451f
class SpotListScreen extends StatefulWidget {
=======
class CustomButtomBar extends StatelessWidget {
  const CustomButtomBar({
    Key? key,
  }) : super(key: key);

>>>>>>> 34c3a56ec4f215777a2595fb8b2115b204b5a699
  @override
<<<<<<< HEAD
  Widget build(BuildContext context) {
    // int likeNum = 0;

    //カテゴリIDと一致するものに絞り込み
    final oneSpotList = spotList.where((_list) => _list.category_id == catsId);

    return Expanded(
      child: ListView.builder(
          itemCount: oneSpotList.length,//リストからSpot数取得
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                  //tileColor: Colors.blue,
                  leading: Container(
                      width: 100,
                      height: 75,
                      child: Image.asset(oneSpotList.toList()[index].image.toString())),
                  title: Text(oneSpotList.toList()[index].name.toString()),//spotList[index].name),
                  subtitle: Text(oneSpotList.toList()[index].address.toString()),
                  trailing: SizedBox(width:90,child: LikeWidget()),//LikeWidget(),//Icon(Icons.more_vert),
                  enabled: true,
                  onTap: () {
                    String spotId = oneSpotList.toList()[index].id.toString();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SpotDetailScreen(spotId:spotId)),
                    );
                  }
                ),
            );
          }),
    );
  }
}

// //Google map 表示
// class ShowGmap extends StatelessWidget {
//   const ShowGmap({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Image.asset('assets/images/woven_city.jpeg'),
//     );
//   }
// }

// Like widget作成（Statefull App)
// make Widget
class LikeWidget extends StatefulWidget {
  const LikeWidget({Key? key}) : super(key: key);
  @override
  State<LikeWidget> createState() => LikeWidget_State();
||||||| 69e451f
  _SpotListScreen createState() => _SpotListScreen();
=======
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
>>>>>>> 34c3a56ec4f215777a2595fb8b2115b204b5a699
}

<<<<<<< HEAD
// make State
class LikeWidget_State extends State<LikeWidget> {
||||||| 69e451f
class _SpotListScreen extends State<SpotListScreen> {
  final _controller = TextEditingController();
  String? _inputSpotId;
=======
//Spot一覧をカード表示
class SpotListView extends StatelessWidget {
  const SpotListView({
    Key? key,
  }) : super(key: key);
>>>>>>> 34c3a56ec4f215777a2595fb8b2115b204b5a699

  bool _isLiked = false;
  int likeNum = 0;
  
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Container(
      padding: EdgeInsets.only(right: 12, left: 12),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.end, 
        children: [
          _buildLikeButton(),
          SizedBox(
            child: Text(likeNum.toString()),
            width: 20,
          ),
        ]
      )
||||||| 69e451f
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
                      builder: (BuildContext context) => SpotDetailScreen(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
=======
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
                    width:90, 
                    child: LikeWidget(userId: 'user0001', spotId: spotId,),
                  ),//LikeWidget(),//Icon(Icons.more_vert),
                  enabled: true,
                  onTap: () {
                    // String spotId = oneCatsSpotList[index].id.toString();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SpotDetailScreen(spotId: spotId)),
                    );
                  }
              ),
            );
          }
      ),
>>>>>>> 34c3a56ec4f215777a2595fb8b2115b204b5a699
    );
  }
<<<<<<< HEAD
  
  //Likeボタン押した際に動作
  void _toggleLike() {
    setState(() {
      if(_isLiked){
        _isLiked = false;
        likeNum--;
      } else{
        _isLiked = true;
        likeNum++;
      }
    });
||||||| 69e451f

  void changeTextField(String value) {
    _inputSpotId = value;
=======
}


class LikeWidget extends StatelessWidget {
  final userId;
  final spotId;
  const LikeWidget({ Key? key, this.userId, this.spotId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _likeListInstance = Provider.of<LikeList>(context);
    int _likeNums = _likeListInstance.getLikeNums(spotId);
    
    return Container(
      //padding: EdgeInsets.only(right: 12, left: 12),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.end, 
        children: [
          Expanded(child: _buildLikeButton(_likeListInstance)),
          Expanded(child: Text(_likeNums.toString()),),
        ]
      )
    );
>>>>>>> 34c3a56ec4f215777a2595fb8b2115b204b5a699
  }
<<<<<<< HEAD

  //Likeボタン作成
  Widget _buildLikeButton(){
    return IconButton(
      iconSize: 15,
      padding: const EdgeInsets.only(right: 8, left: 8),
      icon: (_isLiked
          ? const Icon(Icons.favorite)
          : const Icon(Icons.favorite_border)),
      color: kPrimaryColor,
      onPressed: _toggleLike,
    );
  }  
||||||| 69e451f
=======


  //Likeボタン作成
  Widget _buildLikeButton(LikeList _likeListInstance){
    bool _isLikeExsited = _likeListInstance.getIsLikeExisted(userId,spotId);

    return IconButton(
      iconSize: 15,
      padding: const EdgeInsets.only(right: 8, left: 8),
      icon: (_isLikeExsited
          ? const Icon(Icons.favorite)
          : const Icon(Icons.favorite_border)),
      color: kPrimaryColor,
      onPressed: (){
          DateTime _createdDate = DateTime.now();
          _likeListInstance.addOrRemoveLike(userId, spotId, _createdDate);
      }
    );
  }
  
>>>>>>> 34c3a56ec4f215777a2595fb8b2115b204b5a699
}


