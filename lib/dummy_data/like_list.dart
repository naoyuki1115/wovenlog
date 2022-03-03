import 'package:flutter/material.dart';
import 'package:wovenlog/dummy_data/spot_class.dart';
import 'like_class.dart';


class LikeList extends ChangeNotifier{

   //SpotごとのLike数を取得
  int getLikeNums(_spotId){
    return likeList.where((element) => element.spotId == _spotId).length;
  }

  //UserID x SpotIDのLikeリスト上の有無確認
  bool getIsLikeExisted(_userId, _spotId){
    List<Like> narrowDownList = likeList.where((element) => element.userId == _userId).where((element) => element.spotId == _spotId).toList();
    return narrowDownList.isNotEmpty;
  }

  //UserID x SpotIDごとのLikeを取得
  Like getLikePerUserIdAndSpotId(_userId, _spotId){
    return likeList.where((element) => element.userId == _userId).singleWhere((element) => element.spotId == _spotId);
  }

  //Like追加/削除
  void addOrRemoveLike(String? _userId, String? _spotId){
    
    Like _like = Like(
      userId: _userId,
      spotId: _spotId,
      createdDate: DateTime.now(),
    );

    //Likeリスト上を有無確認し、Add or Remove
    if(getIsLikeExisted(_userId, _spotId)){
      //取り除くLikeを取得
      Like _removedLike =  getLikePerUserIdAndSpotId(_userId, _spotId);
      likeList.remove(_removedLike);
    } else {
      likeList.add(_like);
    }
    notifyListeners();
  }

  List<Like> likeList = [
    Like(userId: "user0001", spotId: "spot0001", createdDate: DateTime(2022, 1, 1),),
    Like(userId: "user0001", spotId: "spot0002", createdDate: DateTime(2022, 1, 2),),
    Like(userId: "user0001", spotId: "spot0003", createdDate: DateTime(2022, 1, 1),),
    Like(userId: "user0001", spotId: "spot0004", createdDate: DateTime(2022, 1, 2),),
    Like(userId: "user0001", spotId: "spot0005", createdDate: DateTime(2022, 1, 1),),
    Like(userId: "user0002", spotId: "spot0005", createdDate: DateTime(2022, 1, 1),),
    Like(userId: "user0002", spotId: "spot0004", createdDate: DateTime(2022, 1, 2),),
    Like(userId: "user0002", spotId: "spot0003", createdDate: DateTime(2022, 1, 1),),
    Like(userId: "user0002", spotId: "spot0004", createdDate: DateTime(2022, 1, 2),),
    Like(userId: "user0003", spotId: "spot0005", createdDate: DateTime(2022, 1, 1),),
    Like(userId: "user0003", spotId: "spot0002", createdDate: DateTime(2022, 1, 2),),
    Like(userId: "user0003", spotId: "spot0003", createdDate: DateTime(2022, 1, 1),),
  ];
}