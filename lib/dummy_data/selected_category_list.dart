import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wovenlog/screens/top_screen.dart';

import './selected_category_class.dart';
import './category_list.dart';

class SelectedCategoryList extends ChangeNotifier {
  // This list is saved on the local device via shared preferences.
  List<SelectedCategory> _selectedCategoryList = <SelectedCategory>[];

  SelectedCategoryList() {
    // When the SelectedCategoryList instance created, load shared preference data.
    loadDataViaSharedPreferences();
    // And also check the shared preference already exist on the local device.
    isSharedPreferencesAlreadyExist();
  }

  List<SelectedCategory> get selectedCategoryList => _selectedCategoryList;

  final List<bool> isCheckedList = List<bool>.filled(categoryList.length, false);

  /*
  // This method is used for search selected category and highlight it as red,
  // when user tapped edit button on top screen and tapped each checkbox.
  */
  void updateIsCheckedList() {
    isCheckedList.fillRange(0, categoryList.length, false);
    for (int i = 0; i < _selectedCategoryList.length; i++) {
      for (int j = 0; j < categoryList.length; j++) {
        if (_selectedCategoryList[i].categoryId == categoryList[j].id) {
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

    updateIsCheckedList();
    saveToSharedPreferences();
    notifyListeners();
  }

  /*
  // This method searches, whether the tapped category already exists in
  // the _selectedCategoryList or not.
  */
  bool isCategoryAlreadyExist(String inputCategoryId) {
    for (int i = 0; i < _selectedCategoryList.length; i++) {
      if (_selectedCategoryList[i].categoryId == inputCategoryId) {
        return true;
      }
    }
    return false;
  }

  /*
  // This method searches name and icon of the selected category
  // and used for visualize category icon button on the top screen.
  */
  String searchSelectedCategoryInfo(int index, SearchTarget target) {
    updateIsCheckedList();
    final List<int> newList = [];

    for (int i = 0; i < isCheckedList.length; i++) {
      if (isCheckedList[i] == true) {
        newList.add(i);
      }
    }

    if (newList.isNotEmpty) {
      int _targetIndex = newList[index];
      switch (target) {
        case SearchTarget.name:
          return categoryList[_targetIndex].name;
        case SearchTarget.id:
          return categoryList[_targetIndex].id;
        case SearchTarget.icon:
          return categoryList[_targetIndex].icon;
      }
    } else {
      return "Undefined";
    }
  }

  String beforeId = '';

  List<String> favoriteCats = [];
  int getCategoryInfoForBottomBar(categoryId, bottomBarIndex) {
    final List<int> _sortedList = [];

    for (int i = 0; i < isCheckedList.length; i++) {
      if (isCheckedList[i] == true) {
        _sortedList.add(i);
      }
    }
    String _firstCategoryId = categoryList[_sortedList[0]].id;
    String _secondCategoryId = categoryList[_sortedList[1]].id;
    String _thirdCategoryId = categoryList[_sortedList[2]].id;

    if (bottomBarIndex == 0) {
      if (categoryId == categoryList[_sortedList[0]].id) {
      } else if (categoryId != '') {
        _firstCategoryId = categoryId;
        _secondCategoryId = categoryList[_sortedList[0]].id;
        _thirdCategoryId = categoryList[_sortedList[1]].id;
      }
    } else if (bottomBarIndex == 1) {
      if (categoryId == categoryList[_sortedList[1]].id) {
      } else if (categoryId == categoryList[_sortedList[0]].id) {
        _firstCategoryId = beforeId;
        _secondCategoryId = categoryList[_sortedList[0]].id;
        _thirdCategoryId = categoryList[_sortedList[1]].id;
      }
    } else if (bottomBarIndex == 2) {
      if (categoryId == categoryList[_sortedList[2]].id) {
      } else if (categoryId == categoryList[_sortedList[1]].id) {
        _firstCategoryId = beforeId;
        _secondCategoryId = categoryList[_sortedList[0]].id;
        _thirdCategoryId = categoryList[_sortedList[1]].id;
      }
    }
    favoriteCats = [
      _firstCategoryId,
      _secondCategoryId,
      _thirdCategoryId,
    ];

    beforeId = _firstCategoryId;
    return bottomBarIndex;
  }

  /*
  // Save JSON data to the local device.
  // This medhod will be called when the user tapped checkbox on the edit category screen.
  */
  Future saveToSharedPreferences() async {
    // Convert SelectedCategoryList to JSON type
    List<String> savedSelectedCategoryList = _selectedCategoryList
        .map(
          (f) => json.encode(f.toJson()),
        )
        .toList();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('savedSelectedCategoryList', savedSelectedCategoryList);
  }

  /*
  // Load JSON format data from the local device.
  // And then, decode the data to the SelectedCategoryList type.
  // When the loading ended, isCheckedList will be updated and the top_screen will be rebuild.
  */
  Future loadDataViaSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var result = prefs.getStringList('savedSelectedCategoryList');

    if (result != null) {
      _selectedCategoryList = result
          .map(
            (f) => SelectedCategory.fromJson(json.decode(f)),
          )
          .toList();
    }

    updateIsCheckedList();
    notifyListeners();
  }

  /*
  // Check the shared preference data already exist or not.
  // If the data does not exist, run setInitialSharedPreferences to set 
  // all of the category is true and initialize the shared preference.
  */
  Future isSharedPreferencesAlreadyExist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSharedPreferencesExist = prefs.containsKey('savedSelectedCategoryList');

    if (!isSharedPreferencesExist) {
      setInitialSharedPreferences();
    }
  }

  void setInitialSharedPreferences() {
    initializeSelectedCategoryList();
    updateIsCheckedList();
    saveToSharedPreferences();
  }

  void initializeSelectedCategoryList() {
    _selectedCategoryList = <SelectedCategory>[
      SelectedCategory(userId: "user0001", categoryId: "category0001"),
      SelectedCategory(userId: "user0001", categoryId: "category0002"),
      SelectedCategory(userId: "user0001", categoryId: "category0003"),
      SelectedCategory(userId: "user0001", categoryId: "category0004"),
      SelectedCategory(userId: "user0001", categoryId: "category0005"),
      SelectedCategory(userId: "user0001", categoryId: "category0006"),
      SelectedCategory(userId: "user0001", categoryId: "category0007"),
      SelectedCategory(userId: "user0001", categoryId: "category0008"),
      SelectedCategory(userId: "user0001", categoryId: "category0009"),
      SelectedCategory(userId: "user0001", categoryId: "category0010"),
    ];
  }
}
