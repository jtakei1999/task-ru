import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  var setTime = 1;
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
      appBar: AppBar(
          title: Text('タイマー機能テスト')
      ),

      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top:40, left: 20, right: 20),
              child: Text('取組中のタスク', style: TextStyle(fontSize: 20)),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(25),
              margin: EdgeInsets.only(left: 20, right: 20, top: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.redAccent
              ),
              child: Text('※ 取組中タスクを表示', style: TextStyle(fontSize: 18)),
            ),
            Container(
              margin: EdgeInsets.only(top:60, left: 20, right: 20),
              child: Text('残り時間', style: TextStyle(fontSize: 20)),
            ),
            Container(
              // 内側の余白
              padding: EdgeInsets.all(20),
              // 外側の余白
              margin: EdgeInsets.only(top:5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.black
              ),
              child: Text(_time, style: TextStyle(fontSize: 70, color: Colors.white)),
            ),
            Container(
              margin: EdgeInsets.only(top:80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        elevation: 8,
                      ),
                      child: Text("完了", style: TextStyle(fontSize: 20)),
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
                      child: Text("ギブアップ", style: TextStyle(fontSize: 20)),
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

    var mm1 = setTime-1;
    var ss1 = 59;
    var mm2 = mm1-minutes;
    var ss2 = ss1-(seconds%60);
    String mm3 = mm2.toString();
    String ss3 = ss2.toString();
    String mm4 = (mm2+1).toString();
    String ss4 = (seconds%60).toString();

    if(ss2 < 10){
      String ss2_2 = ss2.toString();
      ss3 = '0'+ss2_2;
    }

    if(mm2 >= 0){
      setState(() => {
        _time = mm3+':'+ss3
      });
    }else{
      setState(() => {
        _time = mm4+':'+ss4
      });
    }
  }
}

// todo マイナス0の時の表示
// todo マイナスの時の桁数
// todo 文字の色