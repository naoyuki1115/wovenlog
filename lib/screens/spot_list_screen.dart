import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wovenlog/constants.dart';
import 'package:wovenlog/dummy_data/spot_list.dart';
import 'package:wovenlog/dummy_data/category_list.dart';
import '../dummy_data/selected_category_list.dart';
import 'package:wovenlog/screens/spot_detail_screen.dart';
import 'package:wovenlog/screens/spot_post_screen.dart';

class SpotListScreen extends StatelessWidget {
  const SpotListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    //カテゴリIDからカテゴリ名を取得
    final catsId = "category0001";
    String catsName = categoryList.singleWhere((_list) => _list.id == catsId).name.toString();  

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
    
    final _selectedCategoryList = Provider.of<SelectedCategoryList>(context);
    
    //表示するカテゴリID（上位3つ）
    String? _firstCatsId = _selectedCategoryList.selectedCategoryList[0].categoryId;
    String? _secondCatsId = _selectedCategoryList.selectedCategoryList[1].categoryId;
    String? _thirdCatsId = _selectedCategoryList.selectedCategoryList[2].categoryId;

    // void _switchCats(){
    // }
    
    return BottomNavigationBar(
      backgroundColor: kAppBarColor,
      unselectedItemColor: kBackgroundColor,
      selectedItemColor: kPrimaryColor,
      items: [
        _buildBottomIcon(_firstCatsId),
        _buildBottomIcon(_secondCatsId),
        _buildBottomIcon(_thirdCatsId),
      ],
      //onTap: _switchCats(),
    );
  }

  //ボトムバーに表示するアイコンを定義
  BottomNavigationBarItem _buildBottomIcon(_catsId){
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
  final catsId;
  const SpotListView({Key? key, this.catsId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _spotListInstance = Provider.of<SpotList>(context); 

    //カテゴリIDと一致するSpotに絞り込み
    _spotListInstance.narrowDownSpotListByCatsId(catsId);
    List oneCatsSpotList = _spotListInstance.getCatsSpotList();

    return Expanded(
      child: ListView.builder(
          itemCount: oneCatsSpotList.length,//リストからSpot数取得
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                  //tileColor: Colors.blue,
                  leading: Container(
                      width: 100,
                      height: 75,
                      child: Image.asset(oneCatsSpotList[index].image.toString())),
                  title: Text(oneCatsSpotList[index].name.toString()),//spotList[index].name),
                  subtitle: Text(oneCatsSpotList[index].address.toString()),
                  trailing: SizedBox(width:90,child: LikeWidget()),//LikeWidget(),//Icon(Icons.more_vert),
                  enabled: true,
                  onTap: () {
                    String spotId = oneCatsSpotList[index].id.toString();
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
