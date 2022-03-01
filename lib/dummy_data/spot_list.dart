import 'package:flutter/material.dart';

import 'spot_class.dart';
import 'package:wovenlog/dummy_data/category_list.dart';

class SpotList extends ChangeNotifier {

  //最初の読み込みかどうかStateを保持
  bool isFirst = true;

  void switchIsFirst(){
    isFirst = !isFirst;
    notifyListeners();
  }

  //指定のカテゴリIDでSpotリストを絞り込み（Providerへ通知）
  void narrowDownSpotListByCatsId(_catsId){
    _catsSpotList = spotList.where((_list) => _list.categoryId == _catsId).toList();
    notifyListeners();
  }

  //カテゴリで絞り込み後のSpotリスト取得
  List getCatsSpotList(){
    return _catsSpotList;
  }

  //カテゴリで絞り込み後のSpotリストをアップデート
  void upadateCatsSpotList(){
    if(_catsSpotList.isNotEmpty){
      String _catsId = _catsSpotList.first.categoryId.toString();
      narrowDownSpotListByCatsId(_catsId);//Provider通知済み
    }
  }

  //現在絞り込んでいるカテゴリ名を取得
  String getCatsName(){
    String _catsId;
    String _catsName;
    if(_catsSpotList.isNotEmpty){
      _catsId = _catsSpotList.first.categoryId.toString();
      _catsName = categoryList.singleWhere((_list) => _list.id == _catsId).name.toString();
    }else{
      _catsName='error';
    }
    return _catsName;
  }

  //指定のSpotIDと一致するSpot情報を取得
  Spot getSpotInfo(_spotId){
    return spotList.singleWhere((_list) => _list.id == _spotId);
  }

  //Spot追加（Providerへ通知）
  void addSpot(Spot _addedSpot){
    spotList.add(_addedSpot);
    notifyListeners();
  }

  //カテゴリで絞り込み後リスト（Providerで監視）
  List<Spot> _catsSpotList = <Spot>[];

  //Spotリスト（Providerで監視）
  List<Spot> spotList = [
    Spot(
      id: "spot0001",
      name: "McDonald's",
      address: "〒100-0005 Tokyo, Chiyoda City, Marunouchi, 1 Chome−9−1 東京駅一番街",
      latitude: 35.6796886,
      longitude: 139.7678116,
      url:
          "https://www.google.com/maps/place/McDonald's./@35.6796886,139.7678116,15z/data=!4m9!1m2!2m1!1sMcDonald's!3m5!1s0x60188bfeba8313b7:0xf0ef793b5d8bc354!8m2!3d35.679713!4d139.7677172!15sCgpNY0RvbmFsZCdzIgOIAQFaDCIKbWNkb25hbGQnc5IBFGZhc3RfZm9vZF9yZXN0YXVyYW50",
      image: "assets/images/spot_images/spot0001.jpg",
      createdDate: DateTime(2022, 1, 1),
      categoryId: 'category0001',
      description: '東京駅マック',
    ),
    Spot(
      id: "spot0002",
      name: "Yoshinoya",
      address: "〒104-0028 Tokyo, Chuo City, Yaesu, 2 Chome−1, １番通り 地下街 八重洲地下",
      latitude: 35.6803101,
      longitude: 139.7685873,
      url:
          "https://www.google.com/maps/place/Yoshinoya/@35.6803101,139.7685873,15.5z/data=!3m1!5s0x60188bfbd91993eb:0x73e0693562fc525a!4m9!1m2!2m1!1z5ZCJ6YeO5a62!3m5!1s0x60188b855650b9b5:0xaf25dad52db96bb1!8m2!3d35.6797071!4d139.7707412!15sCgnlkInph47lrrYiA4gBAVoLIgnlkInph47lrraSARliZWVmX3JpY2VfYm93bF9yZXN0YXVyYW50",
      image: "assets/images/spot_images/spot0002.jpg",
      createdDate: DateTime(2022, 1, 1),
      categoryId: 'category0001',
      description: '八重洲地下吉野家',
    ),
    Spot(
      id: "spot0003",
      name: "Sukiya",
      address: "〒100-0005 Tokyo, Chiyoda City, Marunouchi, 1 Chome−9−1 東京駅一番街",
      latitude: 35.6796886,
      longitude: 139.7678116,
      url:
          "https://www.google.com/maps/place/McDonald's./@35.6796886,139.7678116,15z/data=!4m9!1m2!2m1!1sMcDonald's!3m5!1s0x60188bfeba8313b7:0xf0ef793b5d8bc354!8m2!3d35.679713!4d139.7677172!15sCgpNY0RvbmFsZCdzIgOIAQFaDCIKbWNkb25hbGQnc5IBFGZhc3RfZm9vZF9yZXN0YXVyYW50",
      image: "assets/images/spot_images/spot0003.jpg",
      createdDate: DateTime(2022, 1, 1),
      categoryId: 'category0001',
      description: '東京駅マック',
    ),
    Spot(
      id: "spot0004",
      name: "Matsuya",
      address: "〒104-0028 Tokyo, Chuo City, Yaesu, 2 Chome−1, １番通り 地下街 八重洲地下",
      latitude: 35.6803101,
      longitude: 139.7685873,
      url:
          "https://www.google.com/maps/place/Yoshinoya/@35.6803101,139.7685873,15.5z/data=!3m1!5s0x60188bfbd91993eb:0x73e0693562fc525a!4m9!1m2!2m1!1z5ZCJ6YeO5a62!3m5!1s0x60188b855650b9b5:0xaf25dad52db96bb1!8m2!3d35.6797071!4d139.7707412!15sCgnlkInph47lrrYiA4gBAVoLIgnlkInph47lrraSARliZWVmX3JpY2VfYm93bF9yZXN0YXVyYW50",
      image: "assets/images/spot_images/spot0004.jpg",
      createdDate: DateTime(2022, 1, 1),
      categoryId: 'category0001',
      description: '八重洲地下吉野家',
    ),
    Spot(
      id: "spot0005",
      name: "KFC",
      address: "〒100-0005 Tokyo, Chiyoda City, Marunouchi, 1 Chome−9−1 東京駅一番街",
      latitude: 35.6796886,
      longitude: 139.7678116,
      url:
          "https://www.google.com/maps/place/McDonald's./@35.6796886,139.7678116,15z/data=!4m9!1m2!2m1!1sMcDonald's!3m5!1s0x60188bfeba8313b7:0xf0ef793b5d8bc354!8m2!3d35.679713!4d139.7677172!15sCgpNY0RvbmFsZCdzIgOIAQFaDCIKbWNkb25hbGQnc5IBFGZhc3RfZm9vZF9yZXN0YXVyYW50",
      image: "assets/images/spot_images/spot0005.jpg",
      createdDate: DateTime(2022, 1, 1),
      categoryId: 'category0001',
      description: '東京駅マック',
    ),
    Spot(
      id: "spot0006",
      name: "Domino's Pizza",
      address: "〒104-0028 Tokyo, Chuo City, Yaesu, 2 Chome−1, １番通り 地下街 八重洲地下",
      latitude: 35.6803101,
      longitude: 139.7685873,
      url:
          "https://www.google.com/maps/place/Yoshinoya/@35.6803101,139.7685873,15.5z/data=!3m1!5s0x60188bfbd91993eb:0x73e0693562fc525a!4m9!1m2!2m1!1z5ZCJ6YeO5a62!3m5!1s0x60188b855650b9b5:0xaf25dad52db96bb1!8m2!3d35.6797071!4d139.7707412!15sCgnlkInph47lrrYiA4gBAVoLIgnlkInph47lrraSARliZWVmX3JpY2VfYm93bF9yZXN0YXVyYW50",
      image: "assets/images/spot_images/spot0006.jpg",
      createdDate: DateTime(2022, 1, 1),
      categoryId: 'category0001',
      description: '八重洲地下吉野家',
    ),
    Spot(
      id: "spot0007",
      name: "Pizza-La",
      address: "〒100-0005 Tokyo, Chiyoda City, Marunouchi, 1 Chome−9−1 東京駅一番街",
      latitude: 35.6796886,
      longitude: 139.7678116,
      url:
          "https://www.google.com/maps/place/McDonald's./@35.6796886,139.7678116,15z/data=!4m9!1m2!2m1!1sMcDonald's!3m5!1s0x60188bfeba8313b7:0xf0ef793b5d8bc354!8m2!3d35.679713!4d139.7677172!15sCgpNY0RvbmFsZCdzIgOIAQFaDCIKbWNkb25hbGQnc5IBFGZhc3RfZm9vZF9yZXN0YXVyYW50",
      image: "assets/images/spot_images/spot0007.jpg",
      createdDate: DateTime(2022, 1, 1),
      categoryId: 'category0001',
      description: '東京駅マック',
    ),
    Spot(
      id: "spot0008",
      name: "Pizza Hut",
      address: "〒104-0028 Tokyo, Chuo City, Yaesu, 2 Chome−1, １番通り 地下街 八重洲地下",
      latitude: 35.6803101,
      longitude: 139.7685873,
      url:
          "https://www.google.com/maps/place/Yoshinoya/@35.6803101,139.7685873,15.5z/data=!3m1!5s0x60188bfbd91993eb:0x73e0693562fc525a!4m9!1m2!2m1!1z5ZCJ6YeO5a62!3m5!1s0x60188b855650b9b5:0xaf25dad52db96bb1!8m2!3d35.6797071!4d139.7707412!15sCgnlkInph47lrrYiA4gBAVoLIgnlkInph47lrraSARliZWVmX3JpY2VfYm93bF9yZXN0YXVyYW50",
      image: "assets/images/spot_images/spot0008.jpg",
      createdDate: DateTime(2022, 1, 1),
      categoryId: 'category0001',
      description: '八重洲地下吉野家',
    ),
    Spot(
      id: "spot0009",
      name: "GoGo Cury",
      address: "〒100-0005 Tokyo, Chiyoda City, Marunouchi, 1 Chome−9−1 東京駅一番街",
      latitude: 35.6796886,
      longitude: 139.7678116,
      url:
          "https://www.google.com/maps/place/McDonald's./@35.6796886,139.7678116,15z/data=!4m9!1m2!2m1!1sMcDonald's!3m5!1s0x60188bfeba8313b7:0xf0ef793b5d8bc354!8m2!3d35.679713!4d139.7677172!15sCgpNY0RvbmFsZCdzIgOIAQFaDCIKbWNkb25hbGQnc5IBFGZhc3RfZm9vZF9yZXN0YXVyYW50",
      image: "assets/images/spot_images/spot0009.jpg",
      createdDate: DateTime(2022, 1, 1),
      categoryId: 'category0001',
      description: '東京駅マック',
    ),
    Spot(
      id: "spot0010",
      name: "Hidakaya",
      address: "〒104-0028 Tokyo, Chuo City, Yaesu, 2 Chome−1, １番通り 地下街 八重洲地下",
      latitude: 35.6803101,
      longitude: 139.7685873,
      url:
          "https://www.google.com/maps/place/Yoshinoya/@35.6803101,139.7685873,15.5z/data=!3m1!5s0x60188bfbd91993eb:0x73e0693562fc525a!4m9!1m2!2m1!1z5ZCJ6YeO5a62!3m5!1s0x60188b855650b9b5:0xaf25dad52db96bb1!8m2!3d35.6797071!4d139.7707412!15sCgnlkInph47lrrYiA4gBAVoLIgnlkInph47lrraSARliZWVmX3JpY2VfYm93bF9yZXN0YXVyYW50",
      image: "assets/images/spot_images/spot0010.jpg",
      createdDate: DateTime(2022, 1, 1),
      categoryId: 'category0001',
      description: '八重洲地下吉野家',
    ),
    Spot(
      id: "spot0011",
      name: "八重洲地下街喫煙室",
      address: "〒103-0028 Tokyo, Chuo City, Yaesu, 2 Chome−1−1 八重洲地下街 B1",
      latitude: 35.6830607,
      longitude: 139.7650784,
      url:
          "https://www.google.com/maps/place/%E5%85%AB%E9%87%8D%E6%B4%B2%E5%9C%B0%E4%B8%8B%E8%A1%97%E5%96%AB%E7%85%99%E5%AE%A4/@35.6830607,139.7650784,15.25z/data=!3m1!5s0x60188bfbd91993eb:0x73e0693562fc525a!4m9!1m2!2m1!1z5Zar54WZ5omA!3m5!1s0x60188bfd3a6a8e8f:0x169881cd09f8f45a!8m2!3d35.6794871!4d139.7711919!15sCgnllqvnhZnmiYBaDCIK5Zar54WZIOaJgJIBCWJhcl90YWJhY5oBJENoZERTVWhOTUc5blMwVkpRMEZuU1VScE5HUm1WbWRSUlJBQg",
      image: "assets/images/spot_images/spot0011.jpg",
      createdDate: DateTime(2021, 1, 1),
      categoryId: 'category0002',
      description: '東京駅喫煙所',
    ),
    Spot(
      id: "spot0012",
      name: "本石町公園喫煙所",
      address: "3 Chome-1-5 Nihonbashihongokucho, Chuo City, Tokyo 103-0021",
      latitude: 35.6824743,
      longitude: 139.7697699,
      url:
          "https://www.google.com/maps/place/%E6%9C%AC%E7%9F%B3%E7%94%BA%E5%85%AC%E5%9C%92%E5%96%AB%E7%85%99%E6%89%80/@35.6824743,139.7697699,15.5z/data=!4m9!1m2!2m1!1z5Zar54WZ5omA!3m5!1s0x60188bb68108046b:0x43a9dfac710f0e74!8m2!3d35.686718!4d139.770356!15sCgnllqvnhZnmiYBaDCIK5Zar54WZIOaJgJIBBmxvdW5nZQ",
      image: "assets/images/spot_images/spot0012.jpg",
      createdDate: DateTime(2021, 1, 1),
      categoryId: 'category0002',
      description: '本石町公園喫煙所',
    ),
    Spot(
      id: "spot0013",
      name: "八重洲地下街喫煙室",
      address: "〒103-0028 Tokyo, Chuo City, Yaesu, 2 Chome−1−1 八重洲地下街 B1",
      latitude: 35.6830607,
      longitude: 139.7650784,
      url:
          "https://www.google.com/maps/place/%E5%85%AB%E9%87%8D%E6%B4%B2%E5%9C%B0%E4%B8%8B%E8%A1%97%E5%96%AB%E7%85%99%E5%AE%A4/@35.6830607,139.7650784,15.25z/data=!3m1!5s0x60188bfbd91993eb:0x73e0693562fc525a!4m9!1m2!2m1!1z5Zar54WZ5omA!3m5!1s0x60188bfd3a6a8e8f:0x169881cd09f8f45a!8m2!3d35.6794871!4d139.7711919!15sCgnllqvnhZnmiYBaDCIK5Zar54WZIOaJgJIBCWJhcl90YWJhY5oBJENoZERTVWhOTUc5blMwVkpRMEZuU1VScE5HUm1WbWRSUlJBQg",
      image: "assets/images/spot_images/spot0011.jpg",
      createdDate: DateTime(2021, 1, 1),
      categoryId: 'category0002',
      description: '東京駅喫煙所',
    ),
    Spot(
      id: "spot0014",
      name: "八重洲地下街喫煙室",
      address: "3 Chome-1-5 Nihonbashihongokucho, Chuo City, Tokyo 103-0021",
      latitude: 35.6824743,
      longitude: 139.7697699,
      url:
          "https://www.google.com/maps/place/%E6%9C%AC%E7%9F%B3%E7%94%BA%E5%85%AC%E5%9C%92%E5%96%AB%E7%85%99%E6%89%80/@35.6824743,139.7697699,15.5z/data=!4m9!1m2!2m1!1z5Zar54WZ5omA!3m5!1s0x60188bb68108046b:0x43a9dfac710f0e74!8m2!3d35.686718!4d139.770356!15sCgnllqvnhZnmiYBaDCIK5Zar54WZIOaJgJIBBmxvdW5nZQ",
      image: "assets/images/spot_images/spot0012.jpg",
      createdDate: DateTime(2021, 1, 1),
      categoryId: 'category0002',
      description: '本石町公園喫煙所',
    ),
    Spot(
      id: "spot0015",
      name: "八重洲地下街喫煙室",
      address: "〒103-0028 Tokyo, Chuo City, Yaesu, 2 Chome−1−1 八重洲地下街 B1",
      latitude: 35.6830607,
      longitude: 139.7650784,
      url:
          "https://www.google.com/maps/place/%E5%85%AB%E9%87%8D%E6%B4%B2%E5%9C%B0%E4%B8%8B%E8%A1%97%E5%96%AB%E7%85%99%E5%AE%A4/@35.6830607,139.7650784,15.25z/data=!3m1!5s0x60188bfbd91993eb:0x73e0693562fc525a!4m9!1m2!2m1!1z5Zar54WZ5omA!3m5!1s0x60188bfd3a6a8e8f:0x169881cd09f8f45a!8m2!3d35.6794871!4d139.7711919!15sCgnllqvnhZnmiYBaDCIK5Zar54WZIOaJgJIBCWJhcl90YWJhY5oBJENoZERTVWhOTUc5blMwVkpRMEZuU1VScE5HUm1WbWRSUlJBQg",
      image: "assets/images/spot_images/spot0011.jpg",
      createdDate: DateTime(2021, 1, 1),
      categoryId: 'category0002',
      description: '東京駅喫煙所',
    ),
    Spot(
      id: "spot0016",
      name: "八重洲地下街喫煙室",
      address: "3 Chome-1-5 Nihonbashihongokucho, Chuo City, Tokyo 103-0021",
      latitude: 35.6824743,
      longitude: 139.7697699,
      url:
          "https://www.google.com/maps/place/%E6%9C%AC%E7%9F%B3%E7%94%BA%E5%85%AC%E5%9C%92%E5%96%AB%E7%85%99%E6%89%80/@35.6824743,139.7697699,15.5z/data=!4m9!1m2!2m1!1z5Zar54WZ5omA!3m5!1s0x60188bb68108046b:0x43a9dfac710f0e74!8m2!3d35.686718!4d139.770356!15sCgnllqvnhZnmiYBaDCIK5Zar54WZIOaJgJIBBmxvdW5nZQ",
      image: "assets/images/spot_images/spot0012.jpg",
      createdDate: DateTime(2021, 1, 1),
      categoryId: 'category0002',
      description: '本石町公園喫煙所',
    ),
    Spot(
      id: "spot0017",
      name: "八重洲地下街喫煙室",
      address: "〒103-0028 Tokyo, Chuo City, Yaesu, 2 Chome−1−1 八重洲地下街 B1",
      latitude: 35.6830607,
      longitude: 139.7650784,
      url:
          "https://www.google.com/maps/place/%E5%85%AB%E9%87%8D%E6%B4%B2%E5%9C%B0%E4%B8%8B%E8%A1%97%E5%96%AB%E7%85%99%E5%AE%A4/@35.6830607,139.7650784,15.25z/data=!3m1!5s0x60188bfbd91993eb:0x73e0693562fc525a!4m9!1m2!2m1!1z5Zar54WZ5omA!3m5!1s0x60188bfd3a6a8e8f:0x169881cd09f8f45a!8m2!3d35.6794871!4d139.7711919!15sCgnllqvnhZnmiYBaDCIK5Zar54WZIOaJgJIBCWJhcl90YWJhY5oBJENoZERTVWhOTUc5blMwVkpRMEZuU1VScE5HUm1WbWRSUlJBQg",
      image: "assets/images/spot_images/spot0011.jpg",
      createdDate: DateTime(2021, 1, 1),
      categoryId: 'category0002',
      description: '東京駅喫煙所',
    ),
    Spot(
      id: "spot0018",
      name: "八重洲地下街喫煙室",
      address: "3 Chome-1-5 Nihonbashihongokucho, Chuo City, Tokyo 103-0021",
      latitude: 35.6824743,
      longitude: 139.7697699,
      url:
          "https://www.google.com/maps/place/%E6%9C%AC%E7%9F%B3%E7%94%BA%E5%85%AC%E5%9C%92%E5%96%AB%E7%85%99%E6%89%80/@35.6824743,139.7697699,15.5z/data=!4m9!1m2!2m1!1z5Zar54WZ5omA!3m5!1s0x60188bb68108046b:0x43a9dfac710f0e74!8m2!3d35.686718!4d139.770356!15sCgnllqvnhZnmiYBaDCIK5Zar54WZIOaJgJIBBmxvdW5nZQ",
      image: "assets/images/spot_images/spot0012.jpg",
      createdDate: DateTime(2021, 1, 1),
      categoryId: 'category0002',
      description: '本石町公園喫煙所',
    ),
    Spot(
      id: "spot0019",
      name: "八重洲地下街喫煙室",
      address: "〒103-0028 Tokyo, Chuo City, Yaesu, 2 Chome−1−1 八重洲地下街 B1",
      latitude: 35.6830607,
      longitude: 139.7650784,
      url:
          "https://www.google.com/maps/place/%E5%85%AB%E9%87%8D%E6%B4%B2%E5%9C%B0%E4%B8%8B%E8%A1%97%E5%96%AB%E7%85%99%E5%AE%A4/@35.6830607,139.7650784,15.25z/data=!3m1!5s0x60188bfbd91993eb:0x73e0693562fc525a!4m9!1m2!2m1!1z5Zar54WZ5omA!3m5!1s0x60188bfd3a6a8e8f:0x169881cd09f8f45a!8m2!3d35.6794871!4d139.7711919!15sCgnllqvnhZnmiYBaDCIK5Zar54WZIOaJgJIBCWJhcl90YWJhY5oBJENoZERTVWhOTUc5blMwVkpRMEZuU1VScE5HUm1WbWRSUlJBQg",
      image: "assets/images/spot_images/spot0011.jpg",
      createdDate: DateTime(2021, 1, 1),
      categoryId: 'category0002',
      description: '東京駅喫煙所',
    ),
    Spot(
      id: "spot0020",
      name: "八重洲地下街喫煙室",
      address: "3 Chome-1-5 Nihonbashihongokucho, Chuo City, Tokyo 103-0021",
      latitude: 35.6824743,
      longitude: 139.7697699,
      url:
          "https://www.google.com/maps/place/%E6%9C%AC%E7%9F%B3%E7%94%BA%E5%85%AC%E5%9C%92%E5%96%AB%E7%85%99%E6%89%80/@35.6824743,139.7697699,15.5z/data=!4m9!1m2!2m1!1z5Zar54WZ5omA!3m5!1s0x60188bb68108046b:0x43a9dfac710f0e74!8m2!3d35.686718!4d139.770356!15sCgnllqvnhZnmiYBaDCIK5Zar54WZIOaJgJIBBmxvdW5nZQ",
      image: "assets/images/spot_images/spot0012.jpg",
      createdDate: DateTime(2021, 1, 1),
      categoryId: 'category0002',
      description: '本石町公園喫煙所',
    ),
    Spot(
      id: "spot0021",
      name: "東京駅駅舎",
      address: "1 Chome-9 Marunouchi, Chiyoda City, Tokyo 100-0005",
      latitude: 35.6818706,
      longitude: 139.7592828,
      url:
          "https://www.google.com/maps/place/%E6%9D%B1%E4%BA%AC%E9%A7%85/@35.6818706,139.7592828,16z/data=!3m1!5s0x60188bfbd91993eb:0xc9da05c5e162fa6a!4m9!1m2!2m1!1z6Kaz5YWJ5ZCN5omA!3m5!1s0x60188b4f67a3da13:0xc8260b15f22c2042!8m2!3d35.6811993!4d139.7659371!15sCgzoprPlhYnlkI3miYCSARJ0b3VyaXN0X2F0dHJhY3Rpb24",
      image: "assets/images/spot_images/spot0021.jpg",
      createdDate: DateTime(2020, 1, 1),
      categoryId: 'category0003',
      description: '東京駅丸の内',
    ),
    Spot(
      id: "spot0022",
      name: "皇居前広場",
      address: "2 Kokyogaien, Chiyoda City, Tokyo 100-0002",
      latitude: 35.6811152,
      longitude: 139.7560612,
      url:
          "https://www.google.com/maps/place/Imperial+Palace+Front+Gardens/@35.6811152,139.7560612,16.25z/data=!4m9!1m3!2m2!1z6Kaz5YWJ5ZCN5omA!6e1!3m4!1s0x60188bf5d740e7a7:0xf04856902f747!8m2!3d35.6806711!4d139.7572871",
      image: "assets/images/spot_images/spot0022.jpg",
      createdDate: DateTime(2020, 1, 1),
      categoryId: 'category0003',
      description: '皇居前広場',
    ),
    Spot(
      id: "spot0023",
      name: "東京駅駅舎",
      address: "1 Chome-9 Marunouchi, Chiyoda City, Tokyo 100-0005",
      latitude: 35.6818706,
      longitude: 139.7592828,
      url:
          "https://www.google.com/maps/place/%E6%9D%B1%E4%BA%AC%E9%A7%85/@35.6818706,139.7592828,16z/data=!3m1!5s0x60188bfbd91993eb:0xc9da05c5e162fa6a!4m9!1m2!2m1!1z6Kaz5YWJ5ZCN5omA!3m5!1s0x60188b4f67a3da13:0xc8260b15f22c2042!8m2!3d35.6811993!4d139.7659371!15sCgzoprPlhYnlkI3miYCSARJ0b3VyaXN0X2F0dHJhY3Rpb24",
      image: "assets/images/spot_images/spot0021.jpg",
      createdDate: DateTime(2020, 1, 1),
      categoryId: 'category0003',
      description: '東京駅丸の内',
    ),
    Spot(
      id: "spot0024",
      name: "皇居前広場",
      address: "2 Kokyogaien, Chiyoda City, Tokyo 100-0002",
      latitude: 35.6811152,
      longitude: 139.7560612,
      url:
          "https://www.google.com/maps/place/Imperial+Palace+Front+Gardens/@35.6811152,139.7560612,16.25z/data=!4m9!1m3!2m2!1z6Kaz5YWJ5ZCN5omA!6e1!3m4!1s0x60188bf5d740e7a7:0xf04856902f747!8m2!3d35.6806711!4d139.7572871",
      image: "assets/images/spot_images/spot0022.jpg",
      createdDate: DateTime(2020, 1, 1),
      categoryId: 'category0003',
      description: '皇居前広場',
    ),
    Spot(
      id: "spot0025",
      name: "東京駅駅舎",
      address: "1 Chome-9 Marunouchi, Chiyoda City, Tokyo 100-0005",
      latitude: 35.6818706,
      longitude: 139.7592828,
      url:
          "https://www.google.com/maps/place/%E6%9D%B1%E4%BA%AC%E9%A7%85/@35.6818706,139.7592828,16z/data=!3m1!5s0x60188bfbd91993eb:0xc9da05c5e162fa6a!4m9!1m2!2m1!1z6Kaz5YWJ5ZCN5omA!3m5!1s0x60188b4f67a3da13:0xc8260b15f22c2042!8m2!3d35.6811993!4d139.7659371!15sCgzoprPlhYnlkI3miYCSARJ0b3VyaXN0X2F0dHJhY3Rpb24",
      image: "assets/images/spot_images/spot0021.jpg",
      createdDate: DateTime(2020, 1, 1),
      categoryId: 'category0003',
      description: '東京駅丸の内',
    ),
    Spot(
      id: "spot0026",
      name: "皇居前広場",
      address: "2 Kokyogaien, Chiyoda City, Tokyo 100-0002",
      latitude: 35.6811152,
      longitude: 139.7560612,
      url:
          "https://www.google.com/maps/place/Imperial+Palace+Front+Gardens/@35.6811152,139.7560612,16.25z/data=!4m9!1m3!2m2!1z6Kaz5YWJ5ZCN5omA!6e1!3m4!1s0x60188bf5d740e7a7:0xf04856902f747!8m2!3d35.6806711!4d139.7572871",
      image: "assets/images/spot_images/spot0022.jpg",
      createdDate: DateTime(2020, 1, 1),
      categoryId: 'category0003',
      description: '皇居前広場',
    ),
    Spot(
      id: "spot0027",
      name: "東京駅駅舎",
      address: "1 Chome-9 Marunouchi, Chiyoda City, Tokyo 100-0005",
      latitude: 35.6818706,
      longitude: 139.7592828,
      url:
          "https://www.google.com/maps/place/%E6%9D%B1%E4%BA%AC%E9%A7%85/@35.6818706,139.7592828,16z/data=!3m1!5s0x60188bfbd91993eb:0xc9da05c5e162fa6a!4m9!1m2!2m1!1z6Kaz5YWJ5ZCN5omA!3m5!1s0x60188b4f67a3da13:0xc8260b15f22c2042!8m2!3d35.6811993!4d139.7659371!15sCgzoprPlhYnlkI3miYCSARJ0b3VyaXN0X2F0dHJhY3Rpb24",
      image: "assets/images/spot_images/spot0021.jpg",
      createdDate: DateTime(2020, 1, 1),
      categoryId: 'category0003',
      description: '東京駅丸の内',
    ),
    Spot(
      id: "spot0028",
      name: "皇居前広場",
      address: "2 Kokyogaien, Chiyoda City, Tokyo 100-0002",
      latitude: 35.6811152,
      longitude: 139.7560612,
      url:
          "https://www.google.com/maps/place/Imperial+Palace+Front+Gardens/@35.6811152,139.7560612,16.25z/data=!4m9!1m3!2m2!1z6Kaz5YWJ5ZCN5omA!6e1!3m4!1s0x60188bf5d740e7a7:0xf04856902f747!8m2!3d35.6806711!4d139.7572871",
      image: "assets/images/spot_images/spot0022.jpg",
      createdDate: DateTime(2020, 1, 1),
      categoryId: 'category0003',
      description: '皇居前広場',
    ),
    Spot(
      id: "spot0029",
      name: "東京駅駅舎",
      address: "1 Chome-9 Marunouchi, Chiyoda City, Tokyo 100-0005",
      latitude: 35.6818706,
      longitude: 139.7592828,
      url:
          "https://www.google.com/maps/place/%E6%9D%B1%E4%BA%AC%E9%A7%85/@35.6818706,139.7592828,16z/data=!3m1!5s0x60188bfbd91993eb:0xc9da05c5e162fa6a!4m9!1m2!2m1!1z6Kaz5YWJ5ZCN5omA!3m5!1s0x60188b4f67a3da13:0xc8260b15f22c2042!8m2!3d35.6811993!4d139.7659371!15sCgzoprPlhYnlkI3miYCSARJ0b3VyaXN0X2F0dHJhY3Rpb24",
      image: "assets/images/spot_images/spot0021.jpg",
      createdDate: DateTime(2020, 1, 1),
      categoryId: 'category0003',
      description: '東京駅丸の内',
    ),
    Spot(
      id: "spot0030",
      name: "皇居前広場",
      address: "2 Kokyogaien, Chiyoda City, Tokyo 100-0002",
      latitude: 35.6811152,
      longitude: 139.7560612,
      url:
          "https://www.google.com/maps/place/Imperial+Palace+Front+Gardens/@35.6811152,139.7560612,16.25z/data=!4m9!1m3!2m2!1z6Kaz5YWJ5ZCN5omA!6e1!3m4!1s0x60188bf5d740e7a7:0xf04856902f747!8m2!3d35.6806711!4d139.7572871",
      image: "assets/images/spot_images/spot0022.jpg",
      createdDate: DateTime(2020, 1, 1),
      categoryId: 'category0003',
      description: '皇居前広場',
    ),
  ];
}
