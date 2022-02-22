import 'package:flutter/material.dart';

import './selected_category_class.dart';
import './category_list.dart';

class SelectedCategoryList extends ChangeNotifier {
  final List<SelectedCategory> _selectedCategoryList = <SelectedCategory>[
    SelectedCategory(userId: "user0001", categoryId: "category0001"),
    SelectedCategory(userId: "user0001", categoryId: "category0003"),
    SelectedCategory(userId: "user0001", categoryId: "category0005"),
    SelectedCategory(userId: "user0001", categoryId: "category0006"),
  ];

  List<SelectedCategory> get selectedCategoryList => _selectedCategoryList;

  final List<bool> isCheckedList = List<bool>.filled(categoryList.length, false);

  /*
  // This method is used for search selected category and highlight it as red,
  // when user tapped edit button on top screen and tapped each checkbox.
  */
  void searchSelectedCategory() {
    isCheckedList.fillRange(0, categoryList.length, false);
    for (int i = 0; i < selectedCategoryList.length; i++) {
      for (int j = 0; j < categoryList.length; j++) {
        if (selectedCategoryList[i].categoryId == categoryList[j].id) {
          isCheckedList[j] = true;
        }
      }
    }
  }

  /*
  // This method is called when user tapped each checkbox.
  // _selectedCategoryList is modified according to user onChanged action.
  */
  void addOrRemove(int index) {
    String _categoryId = categoryList[index].id;
    SelectedCategory _addCategory = SelectedCategory(
      userId: "user0001", // define userId = "user0001" temporary
      categoryId: _categoryId,
    );

    if (!isCategoryAlreadyExist(_categoryId)) {
      _selectedCategoryList.add(_addCategory);
    } else {
      _selectedCategoryList.removeWhere(
        (element) => element.categoryId == _categoryId,
      );
    }

    searchSelectedCategory();
    notifyListeners();
  }

  bool isCategoryAlreadyExist(String inputCategoryId) {
    for (int i = 0; i < _selectedCategoryList.length; i++) {
      if (_selectedCategoryList[i].categoryId == inputCategoryId) {
        return true;
      }
    }
    return false;
  }
}
