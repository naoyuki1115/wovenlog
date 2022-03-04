import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';
import '../dummy_data/category_list.dart';
import '../dummy_data/spot_list.dart';

class SpotPostScreen extends StatefulWidget {
  const SpotPostScreen({Key? key}) : super(key: key);

  @override
  State<SpotPostScreen> createState() => _SpotPostScreenState();
}

class _SpotPostScreenState extends State<SpotPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            context.pop();
          },
        ),
      ),
      body: const InputScreen(),
    );
  }
}

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final _formKey = GlobalKey<FormState>();

  String _spotName = '';
  String _spotURL = '';
  String _spotDescription = '';
  String _errorMsg = '';

  @override
  Widget build(BuildContext context) {
    final _spotListNotifier = Provider.of<SpotList>(context);

    void _saveFormContentsToSpotList() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        _spotListNotifier.addNewSpot(_spotName, _spotURL, _spotDescription,
            _spotListNotifier.categoryName);
      } else {
        _errorMsg = 'Please fill some required info';
      }
    }

    return Form(
      key: _formKey,
      child: Container(
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
                _errorMsg, //loginボタン押下後に表示内容更新
                style: const TextStyle(color: kPrimaryColor),
              ),
            ),
            // 入力フォーム
            Row(
              //テキストフォームの成形のためExpanedを使用
              children: [
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 8,
                  child: Column(
                    children: <Widget>[
                      InputForm(
                          onSaved: (newValue) => _spotName = newValue!,
                          labelText: "Shop name"),
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
                          child: const PullDownButton()),
                      const SizedBox(
                        height: 10,
                      ),
                      InputForm(
                          onSaved: (newValue) => _spotURL = newValue!,
                          labelText: "URL"),
                      const SizedBox(
                        height: 10,
                      ),
                      InputForm(
                          onSaved: (newValue) => _spotDescription = newValue!,
                          labelText: "Description"),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
              ],
            ),
            // 空白
            Expanded(
              flex: 1,
              child: Container(),
            ),
            // 画像投稿フォーム
            const AddImage(),
            // 空白
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
                onPressed: () => _saveFormContentsToSpotList(),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            ),
          ],
        ),
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
  XFile? _image;
  File? _file;
  bool _imageExist = false;
  ImagePicker picker = ImagePicker();

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
    final _spotListNotifier = Provider.of<SpotList>(context);

    Future _getImage() async {
      final image = await picker.pickImage(source: ImageSource.gallery);
      _spotListNotifier.getImage(image);

      setState(() {
        if (image != null) {
          _image = XFile(image.path);
          // File型に変換（Image .file()はXfile非対応のため）
          _file = File(image.path);
          // 画像取得有無の確認用に_imageExistを使用
          _imageExist = true;
        } else {
          _imageExist = false;
        }
      });
      // アプリケーション専用のファイル配置ディレクトリへのパスを取得（）
      // final appDir = await syspaths.getApplicationDocumentsDirectory();
      // //画像名を取得(〜.jpg)
      // final fileName = path.basename(_image!.path);

      // final savedImage = await _file!.copy('${appDir.path}/$fileName');
      // widget.onSelectImage(savedImage);
    }

    return FutureBuilder<String>(
      future: _checkImage(), // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        List<Widget> children;
        if (snapshot.data == "finished") {
          children = <Widget>[
            SizedBox(
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

class InputForm extends StatelessWidget {
  final FormFieldSetter<String> onSaved;
  final String labelText;
  const InputForm({
    Key? key,
    required this.onSaved,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      onSaved: onSaved,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: labelText,
        hintStyle: const TextStyle(color: kFontColor, fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
        ),
      ),
    );
  }
}
