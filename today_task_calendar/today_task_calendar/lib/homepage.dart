import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'footer.dart'; // footer.dart をインポート
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'timer.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const Homepage());
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: Header(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                flex: 7,
                child: SfCalendar(
                  view: CalendarView.month,
                  todayHighlightColor: Colors.red,
                  monthViewSettings: MonthViewSettings(
                    showAgenda: true,
                  ),
                  dataSource: EventDataSource(_getDataSource()),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TimerPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red[800],
                          elevation: 32,
                          minimumSize: Size(280, 40),
                          maximumSize: Size(280, 40)),
                      child: FittedBox(child: Text('所要時間45分:フォーカスゴールド')),
                    ),
                    ElevatedButton(
                      onPressed: () {/* ボタンが押せる時 */},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red[400],
                          elevation: 32,
                          minimumSize: Size(280, 40),
                          maximumSize: Size(280, 40)),
                      child: FittedBox(child: Text('所要時間30分:ターゲット800の勉強')),
                    ),
                    ElevatedButton(
                      onPressed: () {/* ボタンが押せる時 */},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          elevation: 32,
                          minimumSize: Size(280, 40),
                          maximumSize: Size(280, 40)),
                      child: FittedBox(child: Text('所要時間12時間:赤ペン先生')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Footer(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
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
        'ホーム',
      ),
      backgroundColor: Colors.black87,
      centerTitle: true,
      elevation: 0.0,
    );
  }
}

class Event {
  Event(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Event> event) {
    appointments = event;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

List<Event> _getDataSource() {
  final List<Event> event = <Event>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  final DateTime startTime2 =
      DateTime(today.year, today.month, today.day + 1, 9, 0, 0);
  final DateTime endTime2 = startTime.add(const Duration(hours: 2));
  event.add(Event('勉強', startTime, endTime, const Color(0xFF0F8644), false));
  event.add(Event('勉強', startTime2, endTime, const Color(0xFF0F0044), false));
  return event;
}
