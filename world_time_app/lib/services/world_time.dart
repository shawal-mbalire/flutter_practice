import 'dart:convert';

import 'package:http/http.dart';

class WorldTime {
  String country;
  String continent;
  String majorCity;

  late String time;
  late int year;
  late int month;
  late int day;
  late int hour;
  late int minute;
  late int seconds;
  late int milliSeconds;
  late String dateTime;
  late String date;
  late String timeZone;
  late String dayOfWeek;
  late String dstActive;

  WorldTime({
    required this.majorCity,
    required this.country,
    required this.continent,
  });

  Future<void> getTime() async {
    try {
      Response response = await get(
        Uri.parse(
          'https://timeapi.io/api/time/current/zone?timeZone=$continent%2F$majorCity',
        ),
      );
      Map data = JsonDecoder().convert(response.body);
      year = data['year'];
      month = data['month'];
      day = data['day'];
      hour = data['hour'];
      minute = data['minute'];
      seconds = data['seconds'];
      milliSeconds = data['milliSeconds'];
      dateTime = data['dateTime'].toString();
      date = data['date'].toString();
      time = data['time'].toString();
      timeZone = data['timeZone'].toString();
      dayOfWeek = data['dayOfWeek'].toString();
      dstActive = data['dstActive'].toString();
    } catch (e) {
      time = 'Could not get time data';
    }
  }
}
