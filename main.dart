import 'package:flutter/material.dart';

import 'loginpage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //theme: ThemeData(primarySwatch: Colors.blue,
        home: Scaffold(
          appBar: AppBar(
            title:const Text('Hello!'),
          ),
      body:Center(
      child:SafeArea(child:Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children:[Image.network('https://lh3.googleusercontent.com/_QKN2QGGDG8tC_2Vg6XUrf0gS6SUP9jN9NSa9yZZYKCr6qvjuWSro-GPyYpzBA0OMk2Vu9KBPBWM8lFXSAC6-K_q_SqoPOuYJtS5TCgZUxUrnlZWF_RosLPeFZlRLvHPKQ=w1280'),
             Container(
               padding: EdgeInsets.only(top: 40),
               child: Text('早速始めよう！', style: TextStyle(fontSize: 25)),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>
               [
                 ElevatedButton(
                   onPressed: () { Navigator.push(
                       context, MaterialPageRoute(builder: (context) => LoginPage()));},
                   child: Text('ログイン',style: TextStyle(fontSize: 22)),
                 ),
                 ElevatedButton(
                     onPressed: () { /* ボタンがタップされた時の処理 */ },
                     child: Text('新規会員登録',style: TextStyle(fontSize: 20))
                 ),
               ],
             ),
           ],
         ),)
      ),),
    );
  }
  }
