import 'package:flutter/material.dart';
import 'package:wovenlog/constants.dart';
// import '../dummy_data/category_class.dart';
// import 'package:wovenlog/screens/spot_list_screen.dart';

void main() {
  runApp(const SpotPostScreen());
}

// メインクラス
class SpotPostScreen extends StatelessWidget {
  const SpotPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'spot_post_screen',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'POST',
            style: TextStyle(
                fontSize: 20, color: kFontColor, fontWeight: FontWeight.bold),
          ),
          backgroundColor: kAppBarColor,
        ),
        body: Center(
          child: Column(
            children: [
              AddImage(),
              AddProfile(),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              SubmitBottun(),
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

// 画像投稿画面
class AddImage extends StatelessWidget {
  const AddImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
    // Column(
    //   children: [
    //     Expanded(
    //       child: Container(),
    //     ),
    //     const Icon(Icons.add_box_rounded, color: kPrimaryColor, size: 60),
    //     const Text('Upload image'),
    //     Expanded(
    //       child: Container(),
    //     ),
    //   ],
    // );
  }
}

//個人情報入力フォーム
class AddProfile extends StatelessWidget {
  const AddProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Shop Name
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          padding: const EdgeInsets.all(15.0),
          width: 300,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: kFontColor),
            borderRadius: BorderRadius.circular(23),
          ),
          child: const Text(
            "Shop name",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 20, color: kFontColor, fontWeight: FontWeight.bold),
          ),
        ),

        // Category
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          padding: const EdgeInsets.all(15.0),
          width: 300,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: kFontColor),
            borderRadius: BorderRadius.circular(23),
          ),
          child: Row(
            children: [
              Container(
                child: const Text(
                  "Shop name",
                  style: TextStyle(
                      fontSize: 20,
                      color: kFontColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              const Categories(),
            ],
          ),
        ),

        // URL
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          padding: const EdgeInsets.all(15.0),
          width: 300,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: kFontColor),
            borderRadius: BorderRadius.circular(23),
          ),
          child: const Text(
            "URL",
            style: TextStyle(
                fontSize: 20, color: kFontColor, fontWeight: FontWeight.bold),
          ),
        ),

        // Description
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          padding: const EdgeInsets.all(15.0),
          width: 300,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: kFontColor),
            borderRadius: BorderRadius.circular(23),
          ),
          child: const Text(
            "Description",
            style: TextStyle(
                fontSize: 20, color: kFontColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

// サブミットボタン
class SubmitBottun extends StatelessWidget {
  const SubmitBottun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
    // Column(
    //   children: [
    //     Expanded(
    //       flex: 1,
    //       child: Container(),
    //     ),
    child:
    ElevatedButton(
        child: const Text("Submit"),
        style: ElevatedButton.styleFrom(
          primary: const Color(0xffD80C28),
          onPrimary: const Color(0xffFAE1E5),
        ),
        onPressed: () {});
    //         // 前ページへ遷移
    //         Navigator.pop(context);
    //       },
    //       // 保存処理を実行
    //     ),
    //     Expanded(
    //       flex: 2,
    //       child: Container(),
    //     ),
    //   ],
    // );
  }
}

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _Categories();
}

// プルダウンボタン
class _Categories extends State<Categories> {
  // final List category_list = [];
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
