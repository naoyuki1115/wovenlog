import 'package:flutter/material.dart';
import 'package:wovenlog/screens/spot_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Navigator App',
      home: SpotListScreen(),
    );
  }
}

class SpotListScreen extends StatefulWidget {
  @override
  _SpotListScreen createState() => _SpotListScreen();
}

class _SpotListScreen extends State<SpotListScreen> {
  final _controller = TextEditingController();
  String? _inputString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
      ),
      body: Column(
        children: <Widget>[
          Text('入力フォーム'),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          TextField(
            controller: _controller,
            onChanged: changeTextField,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              child: Text('送信'),
              onPressed: () {
                if (_inputString!.isEmpty) {
                  return;
                } else {
                  /// 3. Navigator.push で遷移する際に渡す値を指定する
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          SpotDetailScreen(_inputString!),
                      fullscreenDialog: true,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void changeTextField(String value) {
    _inputString = value;
  }
}
