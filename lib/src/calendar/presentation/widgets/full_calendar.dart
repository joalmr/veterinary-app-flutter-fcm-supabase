import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';
import 'package:vet_app/src/calendar/domain/calendar_controller.dart';

import '../pages/app/day_detail.dart';

int numWeekDay(int year, int month, int day) {
  return DateTime(year, month, day).weekday;
}

class FullCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<CalendarController>(
      builder: (_) {
        return GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: context.width < 900 ? 2 / 3.5 : 1,
          ),
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 2.5),
              child:
                  Align(alignment: Alignment.centerRight, child: Text('Lun')),
            ),
            Container(
              padding: EdgeInsets.only(right: 10, bottom: 2.5),
              child:
                  Align(alignment: Alignment.centerRight, child: Text('Mar')),
            ),
            Container(
              padding: EdgeInsets.only(right: 10, bottom: 2.5),
              child:
                  Align(alignment: Alignment.centerRight, child: Text('Mie')),
            ),
            Container(
              padding: EdgeInsets.only(right: 10, bottom: 2.5),
              child:
                  Align(alignment: Alignment.centerRight, child: Text('Jue')),
            ),
            Container(
              padding: EdgeInsets.only(right: 10, bottom: 2.5),
              child:
                  Align(alignment: Alignment.centerRight, child: Text('Vie')),
            ),
            Container(
              padding: EdgeInsets.only(right: 10, bottom: 2.5),
              child:
                  Align(alignment: Alignment.centerRight, child: Text('Sáb')),
            ),
            Container(
              padding: EdgeInsets.only(right: 10, bottom: 2.5),
              child:
                  Align(alignment: Alignment.centerRight, child: Text('Dom')),
            ),
            for (var i = 1;
                i < numWeekDay(_.valueYear.value, _.valueMonth.value, 1);
                i++)
              SizedBox(
                child: Container(
                  color: Colors.grey[200],
                ),
              ),
            for (var i = 1; i <= _.daysPerMonth.value; i++)
              InkWell(
                onTap: () {
                  var listaBooking = [];
                  var listaEvent = [];
                  var listaNextDate = [];
                  var dateDet =
                      DateTime(_.valueYear.value, _.valueMonth.value, i);
                  if (_.listCalendarBooking[i] != null) {
                    listaBooking.addAll(_.listCalendarBooking[i]);
                  }
                  if (_.listCalendarNextDate[i] != null) {
                    listaNextDate.addAll(_.listCalendarNextDate[i]);
                  }
                  if (_.listCalendarEvent[i] != null) {
                    listaEvent.addAll(_.listCalendarEvent[i]);
                  }
                  Get.to(DayDetail(
                    day: formatDate(dateDet),
                    listaBooking: listaBooking,
                    listaNextDate: listaNextDate,
                    listaEvent: listaEvent,
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[200]!),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 1),
                          child: Text('$i'),
                        ),
                        SizedBox(height: 2.5),
                        SizedBox(
                          width: double.maxFinite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (_.listCalendarBooking[i] == null)
                                SizedBox()
                              else
                                _.listCalendarBooking[i].length > 0
                                    ? itemDay(
                                        'Atenciones',
                                        _.listCalendarBooking[i].length,
                                        colorMain,
                                      )
                                    : SizedBox(),
                              if (_.listCalendarNextDate[i] == null)
                                SizedBox()
                              else
                                (_.listCalendarNextDate[i].length > 0)
                                    ? itemDay(
                                        'Próx.citas',
                                        _.listCalendarNextDate[i].length,
                                        Colors.pinkAccent,
                                      )
                                    : SizedBox(),
                              if (_.listCalendarEvent[i] == null)
                                SizedBox()
                              else
                                _.listCalendarEvent[i].length > 0
                                    ? itemDay(
                                        'Eventos',
                                        _.listCalendarEvent[i].length,
                                        Colors.blueGrey,
                                      )
                                    : SizedBox(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}

Widget itemDay(String tipo, int count, Color color) {
  return Container(
    margin: EdgeInsets.all(1.5),
    padding: EdgeInsets.only(top: 1, bottom: 2),
    width: double.maxFinite,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: color,
    ),
    child: Column(
      children: [
        Text(
          tipo,
          style: TextStyle(
            color: Colors.white,
            fontSize: 8,
          ),
        ),
        SizedBox(height: .5),
        Text(
          count > 99 ? '99+' : '$count',
          style: TextStyle(
            color: Colors.white,
            fontSize: 8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
