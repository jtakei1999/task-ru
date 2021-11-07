import 'package:flutter/material.dart';

import 'loginpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  // ここのcontextは上位ツリーで提供されたMaterialAppを含んでいる。
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello!'),
      ),
      body: Center(
          child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://lh3.googleusercontent.com/lvmh98RIVyztPDlJ_jl_gYASIV46lrwqL4a9D-j74nWymCe5oDUBrr-9xHpH31zwNVilbRFfYguRl-WiGG68zqOI6Y_TLBJyrQPInoXJngDOPKQw2dJHyzhgBsiplOIhEQ=w1280'),
            Container(
              padding: EdgeInsets.only(top: 40),
              child: Text('早速始めよう！', style: TextStyle(fontSize: 25)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text('ログイン', style: TextStyle(fontSize: 22)),
                ),
                ElevatedButton(
                    onPressed: () {
                      /* ボタンがタップされた時の処理 */
                    },
                    child: Text('新規会員登録', style: TextStyle(fontSize: 20))),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
