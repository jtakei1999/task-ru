import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'dummyhomepage.dart';

void main() {
  runApp(TimerPage());
}

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: ClockTimer(),
    );
  }
}

class ClockTimer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClockTimerState();
  }
}

class _ClockTimerState extends State<ClockTimer> {
  /// タイマー文字列用
  String _time = '';

  /// セット時間
  var setTime = 45;

  /// スタート時間を取得する
  var start = DateTime.now();

  @override
  void initState() {
    super.initState();

    /// Timer.periodic は繰り返し実行する時に使うメソッド
    Timer.periodic(Duration(seconds: 1), _onTimer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 35, left: 20, right: 20),
              child: Text('取組中のタスク', style: TextStyle(fontSize: 25)),
            ),
            ElevatedButton(
              onPressed: () {/* ボタンが押せる時 */},
              style: ElevatedButton.styleFrom(
                  primary: Colors.red[800],
                  elevation: 32,
                  minimumSize: Size(280, 70),
                  maximumSize: Size(280, 70)),
              child: FittedBox(child: Text('所要時間45分:フォーカスゴールド')),
            ),
            Container(
              margin: EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Text('残り時間', style: TextStyle(fontSize: 25)),
            ),
            Container(
              // 内側の余白
              padding: EdgeInsets.all(20),
              // 外側の余白
              margin: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.black),
              child: Text(_time,
                  style: TextStyle(fontSize: 70, color: Colors.white)),
            ),
            Container(
              margin: EdgeInsets.only(top: 75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DummyHomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        elevation: 8,
                      ),
                      child: Text("完了", style: TextStyle(fontSize: 23)),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        elevation: 8,
                      ),
                      child: Text("ギブアップ", style: TextStyle(fontSize: 23)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTimer(Timer timer) {
    /// 現在時刻を取得する
    var now = DateTime.now();

    /// 「時:分:秒」表記に文字列を変換するdateFormatを宣言する
    var dateFormat = DateFormat('mm:ss');

    /// nowをdateFormatでstringに変換する
    var timeString = dateFormat.format(now);

    var minutes = now.difference(start).inMinutes;
    var seconds = now.difference(start).inSeconds;
    // print(minutes);
    // print(seconds%60);

    var mm1 = setTime - 1;
    var ss1 = 59;
    var mm2 = mm1 - minutes;
    var ss2 = ss1 - (seconds % 60);
    String mm3 = mm2.toString();
    String ss3 = ss2.toString();
    String mm4 = (mm2 + 1).toString();
    String ss4 = (seconds % 60).toString();

    if (ss2 < 10) {
      String ss2_2 = ss2.toString();
      ss3 = '0' + ss2_2;
    }
    if ((seconds % 60) < 10) {
      String ss4_2 = (seconds % 60).toString();
      ss4 = '0' + ss4_2;
    }
    if (mm2 == -1) {
      mm4 = '-0';
    }

    if (mm2 >= 0) {
      setState(() => {_time = mm3 + ':' + ss3});
    } else {
      setState(() => {_time = mm4 + ':' + ss4});
    }
  }
}

class Header extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.settings),
      ),
      actions: [
        IconButton(
          // IconButtonを追加
          icon: Icon(Icons.add), //Iconsの設定アイコンを指定
          onPressed: () {}, // 動作は空
        ),
      ],
      title: Text(
        '勉強 頑張りましょう!',
      ),
      backgroundColor: Colors.black87,
      centerTitle: true,
      elevation: 0.0,
    );
  }
}
