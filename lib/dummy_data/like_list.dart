import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wovenlog/dummy_data/spot_class.dart';
import 'package:wovenlog/dummy_data/user_class.dart';

import 'like_class.dart';
import 'package:wovenlog/dummy_data/user_list.dart';
import 'package:wovenlog/dummy_data/spot_list.dart';


class LikeList extends ChangeNotifier{

  //UserリストからユーザID一覧を取得
  // List? getUserIdList(){
  //   List userIdList = [];
  //   for (User item in userLists) {
  //     userIdList.add(item.id);
  //   return userIdList;
  // }

  //SpotリストからSpotID一覧を取得



  //Like追加
  void addOrRemoveLike(String? _userId, String? _spotId, DateTime _createdDate){
    
    Like _spot = Like(
      userId: _userId,
      spotId: _spotId,
      createdDate: _createdDate,
    );

    //Likeリスト上を有無確認
    bool isExisted = likeList.contains(_spot); 

    //Add or Remove判定
    isExisted 
      ? likeList.remove(_spot)
      : likeList.add(_spot);

    notifyListeners();
  }

  //SpotごとのLike数を取得
  int getLikeNums(_spotId){
    return likeList.where((element) => element.spotId == _spotId).length;
  }


  List<Like> likeList = [
    Like(userId: "user0001", spotId: "spot0001", createdDate: DateTime(2022, 1, 1),),
    Like(userId: "user0001", spotId: "spot0002", createdDate: DateTime(2022, 1, 2),),
    Like(userId: "user0001", spotId: "spot0003", createdDate: DateTime(2022, 1, 1),),
    Like(userId: "user0001", spotId: "spot0004", createdDate: DateTime(2022, 1, 2),),
    Like(userId: "user0001", spotId: "spot0005", createdDate: DateTime(2022, 1, 1),),
    Like(userId: "user0002", spotId: "spot0001", createdDate: DateTime(2022, 1, 1),),
    Like(userId: "user0002", spotId: "spot0002", createdDate: DateTime(2022, 1, 2),),
    Like(userId: "user0002", spotId: "spot0003", createdDate: DateTime(2022, 1, 1),),
    Like(userId: "user0002", spotId: "spot0004", createdDate: DateTime(2022, 1, 2),),
    Like(userId: "user0003", spotId: "spot0001", createdDate: DateTime(2022, 1, 1),),
    Like(userId: "user0003", spotId: "spot0002", createdDate: DateTime(2022, 1, 2),),
    Like(userId: "user0003", spotId: "spot0003", createdDate: DateTime(2022, 1, 1),),
  ];
}