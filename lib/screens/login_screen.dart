import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wovenlog/constants.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  //ログイン情報
  String userName = '';
  String password = '';
  String errMsg = '';
  bool loginState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      // appBar: AppBar(
      //   title: Text('Login Screen'),
        
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Container()),//余白
          SvgPicture.asset('assets/images/woven_planet_logo.svg'),//Wovenロゴ
          Expanded(child: Container()),//余白]
          Container(
              // color: kSecondaryColor,
              // decoration: BoxDecoration(
              //   //border: Border.all(color: Colors.red),
              //   borderRadius: BorderRadius.circular(10),
              // ),
              child: Text(
                errMsg,
                style: TextStyle(
                  color: kPrimaryColor,
                ),
              ),
          ),
          
          Container(
            //入力フォーム
            padding: EdgeInsets.only(right: 80.0, left: 80.0),
            child: Column(children: [

              //UserName入力フォーム
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'User Name:',
                  //入力フォーム フォントサイズ
                  hintText: 'User Name',
                  //hintStyle: const TextStyle(fontSize: 20),
                  //入力フォーム 背景色
                  fillColor: Colors.white,
                  filled: true,
                  //フォームの丸み
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: BorderSide.none,
                  ),
                  //padding
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
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password:',
                  //入力フォーム フォントサイズ
                  hintText: 'Password',
                  //hintStyle: const TextStyle(fontSize: 20),
                  //入力フォーム 背景色
                  fillColor: Colors.white,
                  filled: true,
                  //フォームの丸み
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: BorderSide.none,
                  ),
                  //padding
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
            ],)
          ),
          Expanded(child: Container()),//余白

          //ログインボタン
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: kSecondaryColor, //ボタンの背景色
                shape: const StadiumBorder(),
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
            onPressed: (){
              setState(() {
                //ログイン機能の関数
                //LoginFunction(userName, password);
                loginState = false;
                //ログイン承認成功時
                if(loginState){
                  //画面遷移
                  errMsg = '認証OK';
                  //Navigater
                //ログイン承認失敗時
                } else {
                  //エラーメッセージ
                  errMsg = '認証失敗';
                }
              });
            }
          ),
          Expanded(child: Container()),//余白

        ]
      )
    
      
    );
  }
}

