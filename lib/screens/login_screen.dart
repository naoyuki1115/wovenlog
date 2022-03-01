import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wovenlog/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //ログイン情報
  String userName = '';
  String password = '';
  String _errMsg = '';
  bool _loginState = false;

  void authentication() {
    //ログイン機能の関数
    //LoginFunction(userName, password);
    //loginState = false;

    //ログイン承認成功時
    if (_loginState) {
      _errMsg = 'Authentication successed';
      //画面遷移
      //Navigater
      //ログイン承認失敗時
    } else {
      //エラーメッセージ
      _errMsg = 'Authentication failed';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        //背景色設定
        backgroundColor: kBackgroundColor,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //ロゴ上の余白
          Expanded(child: Container()), //余白
          //ロゴ
          SvgPicture.asset('assets/images/woven_planet_logo.svg'),
          //ロゴ下の余白
          Expanded(child: Container()), //余白]
          //認証NGメッセージ表示場所
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 30.0),
            child: Text(
              _errMsg, //loginボタン押下後に表示内容更新
              style: TextStyle(color: kPrimaryColor),
            ),
          ),

          //入力フォーム
          Container(
            child: Row(children: [
              //左の余白
              Expanded(
                flex: 1,
                child: Container(),
              ), //余白
              //入力フォーム
              Expanded(
                flex: 8,
                child: Column(
                  children: [
                    //UserName入力フォーム
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'User Name:',
                        hintText: 'User Name',
                        //入力フォーム 背景色
                        fillColor: Colors.white,
                        filled: true,
                        //フォームの丸み
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide.none, //枠線削除
                        ),
                        //入力フォーム内のpadding
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                      ),
                      //入力した値を格納
                      onChanged: (String value) {
                        setState(() {
                          userName = value;
                        });
                      },
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    // パスワード入力フォーム
                    TextFormField(
                      obscureText: true, //入力内容非表示
                      decoration: InputDecoration(
                        labelText: 'Password:',
                        //入力フォーム フォントサイズ
                        hintText: 'Password',
                        //入力フォーム 背景色
                        fillColor: Colors.white,
                        filled: true,
                        //フォームの丸み
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide.none, //枠線削除
                        ),
                        //入力フォーム内のpadding
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              //右の余白
              Expanded(flex: 1, child: Container()), //余白
            ]),
          ),

          //入力フォーム下の余白
          Expanded(child: Container()), //余白

          //ログインボタン
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kSecondaryColor, //ボタンの背景色
                shape: const StadiumBorder(), //ボタンの端を丸める
                padding: EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 20,
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                setState(() {
                  authentication();
                });
              }),
          Expanded(child: Container()), //余白
        ]));
  }
}
