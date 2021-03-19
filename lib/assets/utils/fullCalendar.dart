import 'package:flutter/material.dart';
import 'package:get/get.dart';

int numWeekDay(year, month, day) {
  return DateTime(year, month, day).weekday;
}

Widget fullCalendar({
  @required int daysPerMonth,
  @required int month,
  @required int year,
  BuildContext context,
}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: (context.width - 160) / 7,
            height: 80,
            child: Text('Lun'),
          ),
          Container(
            width: (context.width - 160) / 7,
            height: 80,
            child: Text('Mar'),
          ),
          Container(
            width: (context.width - 160) / 7,
            height: 80,
            child: Text('Mie'),
          ),
          Container(
            width: (context.width - 160) / 7,
            height: 80,
            child: Text('Jue'),
          ),
          Container(
            width: (context.width - 160) / 7,
            height: 80,
            child: Text('Vie'),
          ),
          Container(
            width: (context.width - 160) / 7,
            height: 80,
            child: Text('Sáb'),
          ),
          Container(
            width: (context.width - 160) / 7,
            height: 80,
            child: Text('Dom'),
          ),
        ],
      ),
      Wrap(
        children: [
          for (var i = 1; i < numWeekDay(2021, 3, 1); i++)
            Container(
              padding: EdgeInsets.all(2.5),
              width: (context.width - 160) / 7,
              height: ((context.width - 160) / 7) - 80,
              child: Container(
                color: Colors.grey[300],
              ),
            ),
          for (var i = 0; i < daysPerMonth; i++)
            Container(
              padding: EdgeInsets.all(2.5),
              width: (context.width - 160) / 7,
              height: ((context.width - 160) / 7) - 80,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text((i + 1).toString()),
              ),
            )
        ],
      ),
    ],
  );
}
