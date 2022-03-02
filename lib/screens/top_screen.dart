import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../constants.dart';
import '../dummy_data/selected_category_list.dart';

class TopScreen extends StatelessWidget {
  const TopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This provider of _selectedCategoryList is not needed in case of using SharedPreferences.
    // final _selectedCategoryList = Provider.of<SelectedCategoryList>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Top",
          style: TextStyle(color: kFontColor),
        ),
        backgroundColor: kAppBarColor,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: kPrimaryColor),
          onPressed: () {
            context.push('/top_edit_screen');
          },
        ),
      ),
      body: Stack(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.12),
              BlendMode.dstATop,
            ),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage(
                    'assets/images/woven_city_vertical.jpeg',
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              const Expanded(
                flex: 10,
                child: GridViewSection(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GridViewSection extends StatelessWidget {
  const GridViewSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _selectedCategoryList = Provider.of<SelectedCategoryList>(context);
    final categoryId = 'category0001';

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: _selectedCategoryList.selectedCategoryList.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => context.push('/spot_list_screen/$categoryId'),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 75.0,
                  maxWidth: 75.0,
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kAppBarColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(2, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.asset(
                    _selectedCategoryList.searchSelectedCategoryNameOrIcon(index, false),
                    // categoryList[index].icon,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _selectedCategoryList.searchSelectedCategoryNameOrIcon(index, true),
              style: const TextStyle(color: kFontColor),
            ),
          ],
        );
      },
    );
  }
}
