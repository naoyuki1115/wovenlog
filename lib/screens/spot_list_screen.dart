import 'package:flutter/material.dart';
import 'package:wovenlog/constants.dart';
import 'package:wovenlog/dummy_data/spot_list.dart';
import 'package:wovenlog/dummy_data/category_list.dart';
import 'package:wovenlog/screens/spot_detail_screen.dart';
import 'package:wovenlog/screens/spot_post_screen.dart';

class SpotListScreen extends StatelessWidget {
  const SpotListScreen({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    
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

//Spot一覧をカード表示
class SpotListView extends StatelessWidget {
  final catsId;

  const SpotListView({Key? key, this.catsId}) : super(key: key);
  
  @override
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
}

// make State
class LikeWidget_State extends State<LikeWidget> {

  bool _isLiked = false;
  int likeNum = 0;
  
  @override
  Widget build(BuildContext context) {
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
    );
  }
  
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
  }

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
}
