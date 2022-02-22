import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../dummy_data/category_list.dart';
import '../dummy_data/selected_category_list.dart';
import '../screens/top_screen2.dart';

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

class CheckBoxListView extends StatelessWidget {
  const CheckBoxListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _selectedCategoryList = Provider.of<SelectedCategoryList>(context);

    return Consumer<SelectedCategoryList>(
      builder: (BuildContext context, SelectedCategoryList value, Widget? child) {
        return ListView.builder(
          itemCount: categoryList.length, // value.selectedCategory.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 3.0),
              decoration: BoxDecoration(
                color: _selectedCategoryList.isCheckedList[index] ? kSecondaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: CheckboxListTile(
                activeColor: Colors.red,
                title: Text(
                  categoryList[index].name,
                  style: const TextStyle(fontSize: 20),
                ),
                value: _selectedCategoryList.isCheckedList[index],
                // _isChecked![index],
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (val) {
                  _selectedCategoryList.detectIsSelected(index, val!);
                },
              ),
            );
          },
        );
      },
    );
  }
}
