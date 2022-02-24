import 'package:flutter/material.dart';
import 'package:wovenlog/constants.dart';
import 'package:wovenlog/dummy_data/spot_list.dart';

class SpotListScreen extends StatelessWidget {
  const SpotListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "[Cats name]",
            style: TextStyle(color: kFontColor),
          ),
          backgroundColor: kAppBarColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: kPrimaryColor,
            ),
            //一つ前に戻る
            onPressed: () => {Navigator.pop(context)},
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: kAppBarColor,
          unselectedItemColor: kBackgroundColor,
          selectedItemColor: kPrimaryColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              label: 'Contacts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
          ],
        ),
        body: Column(children: [
          SizedBox(
            height: 10,
            child: Image.asset('assets/spot_images/spot0002.jpg'),
          ),
          SpotListView(),
          //ShowGmap(),

          //   //SpotListView()],
          //   Container(child:

          //     ),
          //   ),

          //   // タイトル・サブタイトル・画像・アイコン等を含めたアイテムが作れる
          // ListTile(
          //   leading: Image.asset('assets/images/woven_city.jpeg'),
          //   title: Text('ListTile'),
          //   subtitle: Text('subtitle'),
          //   trailing: Icon(Icons.more_vert),
          // ),
          // // 影のついたカードUIが作れる
          // Card(
          //   child: Container(
          //     height: 60,
          //     width: double.infinity,
          //     child: Text('Card'),
          //   ),
          // ),
          // // 組み合わせることもOK
          // Card(
          //   child: ListTile(
          //     leading: Image.network('assets/images/woven_city.jpeg'),
          //     title: Text('Card and ListTile'),
          //     subtitle: Text('subtitle'),
          //     trailing: Icon(Icons.more_vert),
          //   ),
          // ),
        ]));
  }
}

class SpotListView extends StatelessWidget {
  const SpotListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: spotList.length,
          itemBuilder: (context, index) {
            // return Card(
            //   child: Container(
            //     height: 80,
            //     width: double.infinity,
            //     child: Text(spotList[index].name),
            //   ),
            // );

            // return ListTile(
            //   title: Text(spotList[index].name),
            // );

            return Card(
              child: Column(children: [
                ListTile(
                  leading: Image.asset(spotList[index].image),
                  title: Text(spotList[index].name),
                  subtitle: Text(spotList[index].address),
                )
              ]),
            );
          }),
    );
  }
}

//Google map 表示
class ShowGmap extends StatelessWidget {
  const ShowGmap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/images/woven_city.jpeg'),
    );
  }
}
