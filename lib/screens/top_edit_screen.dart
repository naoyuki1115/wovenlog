import 'package:flutter/material.dart';

import '../constants.dart';
import '../dummy_data/category_list.dart';
import '../screens/top_screen.dart';

class TopEditScreen extends StatelessWidget {
  const TopEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Favorite Category",
          style: TextStyle(color: kFontColor),
        ),
        backgroundColor: kAppBarColor,
        leading: IconButton(
            icon: const Icon(Icons.menu, color: kPrimaryColor),
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => const TopScreen()),
              );
            }),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        child: CheckBoxListView(),
      ),
    );
  }
}

class CheckBoxListView extends StatefulWidget {
  const CheckBoxListView({Key? key}) : super(key: key);

  @override
  _CheckBoxListViewState createState() => _CheckBoxListViewState();
}

class _CheckBoxListViewState extends State<CheckBoxListView> {
  List<bool>? _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(categoryList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoryList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 3.0),
          decoration: BoxDecoration(
            color: _isChecked![index] ? kSecondaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: CheckboxListTile(
            activeColor: kPrimaryColor,
            title: Text(
              categoryList[index].name,
              style: const TextStyle(fontSize: 20),
            ),
            value: _isChecked![index],
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (val) {
              setState(() {
                _isChecked![index] = val!;
              });
            },
          ),
        );
      },
    );
  }
}
