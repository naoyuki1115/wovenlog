import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';
import '../dummy_data/category_list.dart';
import 'spot_list_screen.dart';

void main() {
  runApp(SpotPostScreen());
}

class SpotPostScreen extends StatefulWidget {
  const SpotPostScreen({Key? key}) : super(key: key);

  @override
  State<SpotPostScreen> createState() => _SpotPostScreenState();
}

String _errMsg = '';
bool _postState = false;

void submit() {
  if (_postState) {
    //画面遷移
    // 登録処理
  } else {
    _errMsg = 'Please fill some required info';
  }
}

class _SpotPostScreenState extends State<SpotPostScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'spot_post_screen',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'Post',
            style: TextStyle(
                fontSize: 20, color: kFontColor, fontWeight: FontWeight.bold),
          ),
          backgroundColor: kAppBarColor,
          // 戻るボタン
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: kPrimaryColor),
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => SpotListScreen()),
              );
            },
          ),
        ),
        body: Container(
          height: 750,
          alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              // Submitエラー表示
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: 30.0),
                child: Text(
                  _errMsg, //loginボタン押下後に表示内容更新
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
              // 入力フォーム
              AddProfile(),
              // 空白
              Expanded(
                flex: 1,
                child: Container(),
              ),
              // 画像投稿フォーム
              AddImage(),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              // Submitボタン
              SizedBox(
                width: 300,
                height: 60,
                child: TextButton(
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  style: TextButton.styleFrom(
                    primary: const Color(0xffD80C28),
                    backgroundColor: kSecondaryColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                  ),
                  onPressed: () {
                    setState(() {
                      // Submit成功可否の表示＆Listへの登録
                      submit();
                    });
                  },
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//個人情報入力フォーム
class AddProfile extends StatefulWidget {
  const AddProfile({Key? key}) : super(key: key);

<<<<<<< HEAD
  @override
  _AddProfileState createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  late FocusNode myFocusNode;

  @override
  // オートフォーカス用にstateを初期化
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  //フォーカス終了
  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 8,
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Spot name",
                    hintText: "Spot name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(23),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // プルダウンボタン表示
                Container(
                    height: 60,
                    alignment: const Alignment(0, 0),
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(23)),
                    child: PullDownButton()),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "URL",
                    hintText: "URL",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(23),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Decription",
                    hintText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(23),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
||||||| b67521c
      //ProviderのtestとしてSpot追加
      body: Column(children: [
        ElevatedButton(
              child: Text('SPOT追加'),
              onPressed: (){
                Spot test = Spot(
                  id: "spot0011",
                  name: "testName",
                  address: "testAddress",
                  latitude: 35.6796886,
                  longitude: 139.7678116,
                  url:
                      "https://www.google.com/maps/place/McDonald's./@35.6796886,139.7678116,15z/data=!4m9!1m2!2m1!1sMcDonald's!3m5!1s0x60188bfeba8313b7:0xf0ef793b5d8bc354!8m2!3d35.679713!4d139.7677172!15sCgpNY0RvbmFsZCdzIgOIAQFaDCIKbWNkb25hbGQnc5IBFGZhc3RfZm9vZF9yZXN0YXVyYW50",
                  image: "assets/images/spot_images/spot0001.jpg",
                  created_date: DateTime(2022, 1, 1),
                  category_id: 'category0001',
                  description: '東京駅マック',
                );

                //追加処理
                _spotListInstance.addSpot(test);
              },
=======
      //ProviderのtestとしてSpot追加
      body: Column(children: [
        ElevatedButton(
              child: Text('SPOT追加'),
              onPressed: (){
                Spot test = Spot(
                  id: "spot0011",
                  name: "testName",
                  address: "testAddress",
                  latitude: 35.6796886,
                  longitude: 139.7678116,
                  url:
                      "https://www.google.com/maps/place/McDonald's./@35.6796886,139.7678116,15z/data=!4m9!1m2!2m1!1sMcDonald's!3m5!1s0x60188bfeba8313b7:0xf0ef793b5d8bc354!8m2!3d35.679713!4d139.7677172!15sCgpNY0RvbmFsZCdzIgOIAQFaDCIKbWNkb25hbGQnc5IBFGZhc3RfZm9vZF9yZXN0YXVyYW50",
                  image: "assets/images/spot_images/spot0001.jpg",
                  createdDate: DateTime(2022, 1, 1),
                  categoryId: 'category0001',
                  description: '東京駅マック',
                );

                //追加処理
                _spotListInstance.addSpot(test);
              },
>>>>>>> 8f298507abb6381fa46c6bbfd52d6f50e6a3d2b5
      ),
    );
  }
}

// プルダウンボタン
class PullDownButton extends StatefulWidget {
  const PullDownButton({Key? key}) : super(key: key);
  @override
  _PullDownButtonState createState() => _PullDownButtonState();
}

class _PullDownButtonState extends State<PullDownButton> {
  // _selectedCategoryはプルダウンから選択されたテキストの受け皿
  String? selectedCategory;
  // listにcategoryListを代入
  List? list = categoryList;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: const Text(
        "Category",
        style: TextStyle(fontSize: 17, color: Color.fromARGB(255, 97, 97, 97)),
      ),
      isExpanded: true,
      // vColor.fromARGB(255, 114, 114, 114)る値、_selectedCategoryをそれと定義
      value: selectedCategory,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 40,
      style: const TextStyle(color: kFontColor, fontSize: 17),
      underline: Container(),
      // newValue=onChangedにて使用する引数
      onChanged: (newvalue) {
        // _selectedCategoryの値の状態をstatとして持ち、setstateで変更し管理する
        setState(() {
          selectedCategory = newvalue as String?;
        });
      },

      items: list?.map((categoryItem) {
        return DropdownMenuItem(
          value: categoryItem.name,
          child: Text(categoryItem.name),
        );
      }).toList(),
    );
  }
}

// 画像投稿機能
class AddImage extends StatefulWidget {
  const AddImage({Key? key}) : super(key: key);

  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  XFile? _image;
  ImagePicker picker = ImagePicker();

  Future _getImage() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        _image = XFile(image.path);
      } else {
        const Text('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kAppBarColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: IconButton(
            onPressed: _getImage,
            icon: const Icon(Icons.add),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Upload image",
          style: TextStyle(fontSize: 20, color: kFontColor),
        ),
      ],
    );
  }
}
