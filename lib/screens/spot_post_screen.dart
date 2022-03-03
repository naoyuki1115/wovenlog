import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wovenlog/dummy_data/spot_list_provider.dart';

import '../constants.dart';
import '../dummy_data/category_list.dart';
import '../dummy_data/spot_list.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Post',
          style: TextStyle(fontSize: 20, color: kFontColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kAppBarColor,
        // 戻るボタン
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: kPrimaryColor),
          onPressed: () {
            context.pop();
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
              constraints: const BoxConstraints(minHeight: 30.0),
              child: Text(
                _errMsg, //loginボタン押下後に表示内容更新
                style: const TextStyle(color: kPrimaryColor),
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
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100))),
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
  late FocusNode myFocusNode;

  String _spotName = '';
  String _spotURL = '';
  String _spotDescription = '';

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
    final _spotListNotifier = Provider.of<SpotList>(context);

    void _saveFormContentsToSpotList() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        _spotListNotifier.addNewSpot(_spotName, _spotURL, _spotDescription, _spotListNotifier.categoryName);
      }
    }

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
                    hintStyle: const TextStyle(color: kFontColor, fontSize: 16),
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
                  onSaved: (newValue) {
                    setState(() {
                      _spotName = newValue!;
                    });
                  },
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
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: const PullDownButton()),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "URL",
                    hintText: "URL",
                    hintStyle: const TextStyle(color: kFontColor, fontSize: 16),
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
                  onSaved: (newValue) {
                    setState(() {
                      _spotURL = newValue!;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Decription",
                    hintText: "Description",
                    hintStyle: const TextStyle(color: kFontColor, fontSize: 16),
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
                  onSaved: (newValue) {
                    setState(() {
                      _spotDescription = newValue!;
                    });
                  },
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
  @override
  Widget build(BuildContext context) {
    final _spotListNotifier = Provider.of<SpotList>(context);

    return DropdownButton(
      hint: const Text(
        "Category",
        style: TextStyle(color: kFontColor, fontSize: 16),
      ),
      isExpanded: true,
      value: _spotListNotifier.categoryName,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 40,
      style: const TextStyle(color: kFontColor, fontSize: 20),
      underline: Container(),
      onChanged: (newvalue) {
        setState(() {
          _spotListNotifier.categoryName = newvalue.toString();
        });
      },
      items: categoryList.map((categoryItem) {
        return DropdownMenuItem(
          value: categoryItem.name,
          child: Text(
            categoryItem.name,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
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
  @override
  Widget build(BuildContext context) {
    final _spotListNotifier = Provider.of<SpotList>(context);

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
            onPressed: _spotListNotifier.getImage,
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
