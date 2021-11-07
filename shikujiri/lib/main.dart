import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(
          // 左側のアイコン
          leading: Icon(Icons.arrow_back_ios),
          // タイトルテキスト
          title: Text(' しくじり先生談'),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            Container(
              margin: EdgeInsets.only(top:100),
              width: double.infinity,
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Image.asset('images/png2.png'),
                    width: 210,
                    height: 210,
                  ),
                  Container(
                    child: Image.asset('images/png4.png'),
                    width: 200,
                    height: 200,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Image.asset('images/png3.png'),
                    width: 200,
                    height: 200,
                  ),
                  Container(
                    child: Image.asset('images/png1.png'),
                    width: 210,
                    height: 210,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}