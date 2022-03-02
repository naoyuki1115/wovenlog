import 'dart:io';

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
                flex: 2,
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
  File? _file;
  bool _imageExist = false;
  ImagePicker picker = ImagePicker();

  Future _getImage() async {
    // ImagePickerを使用し画像Pathを取得
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        _image = XFile(image.path);
        // File型に変換（Image .file()はXfile非対応のため）
        _file = File(image.path);
        // 画像取得有無の確認用に_imageExistを使用
        _imageExist = true;
      }
    });
  }

  Future<String> _checkImage() async {
    // FutureBuilderで監視されるstate
    if (_imageExist) {
      return "finished";
    } else {
      return "Please select image";
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _checkImage(), // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        List<Widget> children;
        if (snapshot.data == "finished") {
          children = <Widget>[
            Container(
                height: 150,
                width: 150,
                child: Image.file(
                  _file!,
                  fit: BoxFit.fill,
                )),
          ];
        } else if (snapshot.data == "Please select image") {
          children = <Widget>[
            // 画像未取得時の画面
            SizedBox(
              height: 150, // 取得した画像のサイズ＝元のUIのサイズにしないとSubmitボタンが崩れるためSizedboxを使用
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
              ),
            ),
          ];
        } else {
          // 画像取得中の画面
          children = const <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            )
          ];
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        );
      },
    );
  }
}

// Submitボタン
class Submit extends StatefulWidget {
  const Submit({Key? key}) : super(key: key);

  @override
  _SubmitState createState() => _SubmitState();
}

String errMsg = '';
bool postState = false;

void submitData() {
  if (postState) {
    //画面遷移
    // 登録処理
  } else {
    errMsg = 'Please fill some required info';
  }
}

class _SubmitState extends State<Submit> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            submitData();
          });
        },
      ),
    );
  }
}
