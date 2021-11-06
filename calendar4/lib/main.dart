import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  runApp(new MaterialApp(
    home: new Test(),
  ));
}
// initiate MyApp as  StatelessWidget
  class Test extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  body: Container(
  child: SfCalendar(
  view: CalendarView.month,
  todayHighlightColor:
  Colors.red,
  monthViewSettings:
  MonthViewSettings(
  showAgenda: true,
  ),
  dataSource:
  EventDataSource(
  _getDataSource()
  ),
  ),
  )
  );
  }}


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
  event.add(
  Event('イベント', startTime, endTime, const Color(0xFF0F8644), false));
  return event;
  }