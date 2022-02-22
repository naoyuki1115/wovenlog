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

  // void add(SelectedCategory selectedCategory) {
  //   _selectedCategoryList.add(selectedCategory);
  //   notifyListeners();
  // }

  /*
  // This method is used for search selected category and highlight it,
  // when user tapped edit button on top screen.
  */

  /*
  void searchSelectedCategory() {
    for (int i = 0; i < categoryList.length; i++) {
      for (int j = 0; j < selectedCategoryList.length; j++) {
        // print(categoryList[i].id);
        // print(selectedCategoryList[j].categoryId);
        print(i);
        print(j);
        print("--------------------------");
        if (categoryList[i].id == selectedCategoryList[j].categoryId) {
          isCheckedList[i] = true;
        } else {
          isCheckedList[i] = false;
        }
      }
    }
    notifyListeners();
  }
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

  void addOrRemove(int index) {
    String _categoryId = categoryList[index].id;
    SelectedCategory _addCategory = SelectedCategory(
      userId: "user0001",
      categoryId: _categoryId,
    );

    if (!isCategoryAlreadyExist(_categoryId)) {
      _selectedCategoryList.add(_addCategory);
    } else {
      _selectedCategoryList.removeWhere(
        (element) => element.categoryId == _categoryId,
      );
    }

    // if (isCheckedList[index] == false) {
    //   _selectedCategoryList.add(_addCategory);
    // } else {
    //   _selectedCategoryList.removeWhere(
    //     (element) => element.categoryId == _categoryId,
    //   );
    // }
    searchSelectedCategory();
    print(_selectedCategoryList.length);
    print(isCheckedList);
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

  // void overWriteIsChekedList(){
  //   for (int i = 0; i < categoryList.length; i++) {
  //     for (int j = 0; j < _selectedCategoryList.length; j++)
  //   }
  // }

  void detectIsSelected(int index, bool val) {
    if (val) {
      isCheckedList[index] = true;
    } else {
      isCheckedList[index] = false;
    }
    print(isCheckedList);
    notifyListeners();
  }

  // print(selectedCategoryList[0].categoryId);
  // print(categoryList[3].id);
}



  // List<bool> detectIsSelected(int index, bool val) {
  //   if (val) {
  //     isCheckedList[index] = false;
  //   } else {
  //     isCheckedList[index] = true;
  //   }
  //   notifyListeners();
  //   return isCheckedList;
  // }