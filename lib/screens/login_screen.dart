import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  //ログイン情報
  String userName = '';
  String password = '';
  String errMsg = 'test';
  bool loginState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
        
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Container()),//余白
          SvgPicture.asset('assets/images/woven_planet_logo.svg'),//Wovenロゴ
          Expanded(child: Container()),//余白
          Text(errMsg),
          Form(//入力フォーム
            child: Column(children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'User Name:'),
                onChanged: (String value) {
                  setState(() {
                    userName = value;
                  });
                },
              ),
              // パスワード入力
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
            ],)
          ),
          Expanded(child: Container()),//余白
          ElevatedButton(
            child: Text('Login'),
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

