import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wovenlog/constants.dart';
import 'package:wovenlog/screens/top_screen.dart';

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
  final _formKey = GlobalKey<FormState>();

  void authentication() {
    String _userId;

    //入力有無判定
    if (userName == '' || password == '') {
      _loginState = false;
    } else {
      _loginState = true;
    }

    //ログイン機能の関数
    //LoginFunction(userName, password);
    _userId = "user0001";

    //ログイン承認成功時
    if (_loginState) {
      _errMsg = 'Authentication successed';
      //画面遷移
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TopScreen(userId: _userId)),
      );
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
        body: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                        CustomFormField(
                          onSaved: (value) => userName = value,
                          fildName: 'User Name',
                        ),
                        const SizedBox(height: 20),
                        // パスワード入力フォーム
                        CustomFormField(
                          onSaved: (value) => password = value,
                          fildName: 'Password',
                          obscureText: true,
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 20,
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        authentication();
                      }
                    });
                  }),
              Expanded(child: Container()), //余白
            ])));
  }
}

class CustomFormField extends StatelessWidget {
  final FormFieldSetter onSaved;
  final String? fildName;
  final bool? obscureText;
  const CustomFormField(
      {Key? key, required this.onSaved, this.fildName, this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText == null ? false : true, //入力内容非表示
      decoration: InputDecoration(
        labelText: fildName,
        //入力フォーム フォントサイズ
        hintText: fildName,
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
      onSaved: onSaved,
    );
  }
}
