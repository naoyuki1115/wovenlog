import 'package:flutter/material.dart';
import 'package:wovenlog/constants.dart';
import 'package:wovenlog/dummy_data/category_list.dart';
import 'package:wovenlog/screens/spot_list_screen.dart';
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
                  MaterialPageRoute(
                      builder: (context) => const SpotListScreen()),
                );
              }),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(),
              ),
              const AddImage(),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              const AddProfile(),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              const SubmitBottun(),
              Expanded(
                flex: 3,
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
            onPressed: (() {}),
            icon: Icon(Icons.add),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Upload image",
          style: TextStyle(fontSize: 20, color: kFontColor),
        ),
      ],
    );
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
          alignment: const Alignment(-0.8, 0),
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
                  "Category",
                  style: TextStyle(
                      fontSize: 20,
                      color: kFontColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              const PullDownButton(),
            ],
          ),
        ),

        // URL
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          alignment: const Alignment(-0.8, 0),
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
          alignment: const Alignment(-0.8, 0),
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
    return SizedBox(
      width: 300,
      height: 60,
      child: TextButton(
        child: const Text(
          "Submit",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        style: TextButton.styleFrom(
          primary: Color(0xffD80C28),
          backgroundColor: kSecondaryColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100))),
        ),
        onPressed: () {
          // Spot List Screenに遷移
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => const SpotListScreen()),
          );
          // 保存処理を実行
        },
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
  String _selectedValue;
  List list = categoryList[0].name;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: 
      onChanged: (newvalue) {
        setState(() {
          _selectedCategory = newvalue!;
        });
            items: _items,
      },
    );
  }
}
