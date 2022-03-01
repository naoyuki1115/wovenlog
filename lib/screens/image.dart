
// import 'dart:io';
// import 'dart:async';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Demo Settings',
//       home: MainScreen(),
//     );
//   }
// }

// class SaveImage {
//   ///アプリ内のストレージ領域に選択したimageを保存。
//   static Future saveLocalImage(PickedFile image) async {
//     //ストレージパス取得
//     final path = await localPath;
//     final String fileName = basename(image.path);
//     final imagePath = '$path/$fileName';
//     //SharePreferenceで画像のストレージパスを保存
//     SharedPrefWrite(imagePath);
//     File imageFile = File(imagePath);
//     //選択した画像をByteDataにしてリターン
//     var saveFile = await imageFile.writeAsBytes(await image.readAsBytes());
//     return saveFile;
//   }

//   ///path_providerでアプリ内のストレージ領域を確保。
//   static Future get localPath async {
//     Directory appDocDir = await getApplicationDocumentsDirectory();
//     String path = appDocDir.path;
//     return path;
//   }

//   ///SharePreferenceにimageのpathを書き込む。
//   static Future SharedPrefWrite(imagePath) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('key', imagePath);
//   }
// }

// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   File imageFile;
//   ImagePicker imagePicker;

//   @override
//   void initState() {
//     super.initState();
//     SharedPrefRead();
//     imagePicker = ImagePicker();
//   }

//   _imgFromGallery() async {
//     final PickedFile pickedFile =
//         await imagePicker.getImage(source: ImageSource.gallery);
//     if (pickedFile == null) {
//       return;
//     }
//     var savedFile = await SaveImage.saveLocalImage(pickedFile);
//     setState(() {
//       imageFile = savedFile;
//     });
//   }

//   ///SharePreferenceに書き込まれたimageのpathを呼び出す。
//   Future<Uint8List> SharedPrefRead() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     String imagePath = prefs.getString('key');

//     ///imageのpathをByteDataに変換
//     ByteData byte = await rootBundle.load(imagePath);

//     ///ByteDataをUint8List変換
//     final Uint8List list = byte.buffer.asUint8List();
//     return list;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("image gallery demo"),
//       ),
//       body: Column(
//         children: [
//           Center(
//             child: (imageFile == null)
//                 ? Icon(Icons.no_sim)
//                 : Image.memory(
//                     imageFile.readAsBytesSync(),
//                     height: 100.0,
//                     width: 100.0,
//                   ),
//           ),
//           Center(
//             child: FutureBuilder(
//               future: SharedPrefRead(),
//               builder: (BuildContext context, AsyncSnapshot snapshot) {
//                 if (snapshot.hasData == true) {
//                   Uint8List image = snapshot.data;
//                   print(snapshot.hasError);
//                   return Center(
//                       child: Image.memory(
//                     image,
//                     scale: 1.0,
//                   ));
//                 } else {
//                   Container();
//                 }
//                 return Text("ざんねん");
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           _imgFromGallery();
//         },
//       ),
//     );
//   }
// }