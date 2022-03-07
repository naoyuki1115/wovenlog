import 'package:flutter/material.dart';

import 'user_class.dart';

class UserList extends ChangeNotifier {

  late String selectedUserId;

  //認証機能
  bool authentication(String _userName, String _password) {
    //入力有無判定
    if (_userName == '' || _password == '') {
      return false;
    } else {
      //DBとユーザ認証
      return getIsUserExisted(_userName, _password);
    }
  }

  //UserID x SpotIDのLikeリスト上の有無確認
  bool getIsUserExisted(_userId, _password){
    List<User> selectedUserList = userLists.where((element) => element.email == _userId).where((element) => element.password == _password).toList();
    bool _authentication = selectedUserList.isNotEmpty;
    if(_authentication){
      selectedUserId = selectedUserList.first.id.toString();
    }
    return _authentication;
  }


  List<User> userLists = <User>[
    User(
      id: "user0000",
      name: "admin",
      email: "a",
      password: "a"
    ),
    User(
      id: "user0001",
      name: "Yoshiaki Toyama",
      email: "yoshiaki.toyama@woven-planet.global",
      password: "toyama"
    ),
    User(
      id: "user0002",
      name: "Yuki Tanaka",
      email: "yuki.tanaka@woven-planet.global",
      password: "tanaka"
    ),
    User(
      id: "user0003",
      name: "Naoyuki Saka",
      email: "naoyuki.saka@woven-planet.global",
      password: "saka"
    ),
  ];
}

/* 
ID:
user0001 - user0003
category0001 - category0010
spot0001 - spot0030
*/