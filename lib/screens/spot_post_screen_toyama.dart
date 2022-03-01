import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';
import '../dummy_data/category_list.dart';
import '../dummy_data/spot_class.dart';
import '../dummy_data/spot_list_provider.dart';
import '../screens/top_screen.dart';

// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:wovenlog/screens/spot_list_screen.dart';

class SpotPostScreen extends StatelessWidget {
  const SpotPostScreen({Key? key}) : super(key: key);

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
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: kPrimaryColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TopScreen()),
              );
            }),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            const AddImage(),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            const AddProfile(),
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
  // String? _spotCategory;

  // function(value) => setState(() => _spotCategory = value);
  // getCategoryName(value) => setState(() => _spotCategory = value);

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
    final _spotListNotifier = Provider.of<SpotListNotifier>(context);

    void _saveFormContentsToSpotList() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        // _spotListNotifier.getImage();

        _spotListNotifier.addNewSpot(_spotName, _spotURL, _spotDescription, _spotListNotifier.categoryName);
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 300,
            height: 60,
            child: TextFormField(
              // controller: _spotNameController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Shop name",
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
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45),
            child: Container(
              height: 60,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(23),
              ),
              child: const PullDownButton(),
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
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
              ),
              onPressed: () => _saveFormContentsToSpotList(),
            ),
          ),
        ],
      ),
    );
  }
}

class PullDownButton extends StatefulWidget {
  const PullDownButton({Key? key}) : super(key: key);
  @override
  _PullDownButtonState createState() => _PullDownButtonState();
}

class _PullDownButtonState extends State<PullDownButton> {
  // _selectedCategoryはプルダウンから選択されたテキストの受け皿
  // String? selectedCategory = null;

  @override
  Widget build(BuildContext context) {
    final _spotListNotifier = Provider.of<SpotListNotifier>(context);

    return DropdownButton(
      hint: const Text(
        "Category",
        style: TextStyle(color: kFontColor, fontSize: 16),
      ),
      isExpanded: true,
      // vColor.fromARGB(255, 114, 114, 114)る値、_selectedCategoryをそれと定義
      value: _spotListNotifier.categoryName,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 40,
      style: const TextStyle(color: kFontColor, fontSize: 20),
      underline: Container(),
      // newValue=onChangedにて使用する引数
      onChanged: (newvalue) {
        // _selectedCategoryの値の状態をstatとして持ち、setstateで変更し管理する
        setState(() {
          // selectedCategory = newvalue as String?;
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
    final _spotListNotifier = Provider.of<SpotListNotifier>(context);

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
            // onPressed: _getImage,
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
