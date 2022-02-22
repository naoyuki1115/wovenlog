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

  void add(SelectedCategory selectedCategory) {
    _selectedCategoryList.add(selectedCategory);
    notifyListeners();
  }

  final List<bool> isCheckedList = List<bool>.filled(categoryList.length, false);

  // List<bool> detectIsSelected(int index, bool val) {
  //   if (val) {
  //     isCheckedList[index] = false;
  //   } else {
  //     isCheckedList[index] = true;
  //   }
  //   notifyListeners();
  //   return isCheckedList;
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
}
