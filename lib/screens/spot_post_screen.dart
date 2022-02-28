import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wovenlog/screens/spot_list_screen.dart';
import 'dart:async';

import '../constants.dart';
import '../dummy_data/category_list.dart';
import '../generated_plugin_registrant.dart';

void main() {
  runApp(SpotPostScreen());
}

// メインクラス
class SpotPostScreen extends StatelessWidget {
  const SpotPostScreen({Key? key}) : super(key: key);

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
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              AddImage(),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              AddProfile(),
              Expanded(
                flex: 4,
                child: Container(),
              ),
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom,
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
  List userInfomations = [];

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 300,
            height: 60,
            child: TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Shop name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(23),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the required infomation';
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            // Padding(
            //   // padding: const EdgeInsets.only(left: 30),
            //   // alignment: const Alignment(-1, 0),
            //   padding: const EdgeInsets.only(left: 45, right: 45),
            child: Container(
                height: 60,
                alignment: const Alignment(0, 0),
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(23)),
                child: PullDownButton()),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            height: 60,
            child: TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: "URL",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(23),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the required infomation';
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            height: 60,
            child: TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(23),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the required infomation';
                }
                return null;
              },
            ),
          ),
          // 空白
          const SizedBox(
            height: 70,
          ),
          // 登録＆前ページに遷移するボタン
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
                if (_formKey.currentState!.validate()) {
                  // 画面遷移
                  // Navigator.pop(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => HomeScreen()),
                  // );
                  // 保存処理
                  // 各入力値をListに代入

                }
              },
            ),
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
