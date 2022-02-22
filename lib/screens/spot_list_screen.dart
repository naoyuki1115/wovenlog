import 'package:flutter/material.dart';
import 'package:wovenlog/screens/spot_post_screen.dart';

class SpotListScreen extends StatelessWidget {
  const SpotListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: TextButton(
        child: Text("1ページ目に遷移する"),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SpotPostScreen(),
              ));
        },
      ),
    );
  }
}

// Column(
//    mainAxisAlignment: MainAxisAlignment.center,
//    children: [
//        Text('top text'),
//        ListView.builder(
//            //shrinkWrap: true が無い
//            itemCount: 20,
//            itemBuilder: (BuildContext context, int index) {
//               return index % 2 == 0 ? Text('item no:$index') : Divider();
//            }),
//        Text('end text')
//        ]
// )

// Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Text('top text'),
//       Flexible(    //Flexibleでラップ
//         child: ListView.builder(
//               itemCount: 600,
//               itemBuilder: (BuildContext context, int index) {
//                 return index % 2 == 0 ? Text('item no: $index') : Divider();
//             }),
//       ),
//       Text('end text')
// ])

