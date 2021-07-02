import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/datetimeFormat.dart';
import 'package:vet_app/src/calendar/domain/calendarController.dart';

import '../pages/app/dayDetail.dart';

int numWeekDay(year, month, day) {
  return DateTime(year, month, day).weekday;
}

class FullCalendar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetX<CalendarController>(
      builder: (_){
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10,bottom: 2.5),
                  width: (context.width) / 7,
                  child: Text('Lun'),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10,bottom: 2.5),
                  width: (context.width) / 7,
                  child: Text('Mar'),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10,bottom: 2.5),
                  width: (context.width) / 7,
                  child: Text('Mie'),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10,bottom: 2.5),
                  width: (context.width) / 7,
                  child: Text('Jue'),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10,bottom: 2.5),
                  width: (context.width) / 7,
                  child: Text('Vie'),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10,bottom: 2.5),
                  width: (context.width) / 7,
                  child: Text('Sáb'),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10,bottom: 2.5),
                  width: (context.width) / 7,
                  child: Text('Dom'),
                ),
              ],
            ),
            Wrap(
              children: [
                for (var i = 1; i < numWeekDay(_.valueYear.value, _.valueMonth.value, 1); i++)
                  Container(
                    width: (context.width ) / 7,
                    height: 100,
                    child: Container(
                      color: Colors.grey[200],
                    ),
                  ),
                for (var i = 1; i <= _.daysPerMonth.value; i++)
                  InkWell(
                    onTap: (){
                      var listaBooking = [];
                      var listaEvent = [];
                      var listaNextDate = [];
                      var dateDet = DateTime(_.valueYear.value, _.valueMonth.value,i);
                      if(_.listCalendarBooking[i] != null){
                        listaBooking.addAll(_.listCalendarBooking[i]);
                      }
                      if(_.listCalendarNextDate[i] != null){
                        listaNextDate.addAll(_.listCalendarNextDate[i]);
                      }
                      if(_.listCalendarEvent[i] != null){
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
                      width: (context.width ) / 7,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(('$i')),
                            ),
                            SizedBox(height: 2.5),
                            Container(
                              width: double.maxFinite,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [     
                                  _.listCalendarBooking[i] == null
                                    ? SizedBox()
                                    : _.listCalendarBooking[i].length > 0 
                                      ? itemDay(
                                        'Atenciones',
                                        _.listCalendarBooking[i].length,
                                        colorMain,
                                      )
                                      : SizedBox(),
                                  _.listCalendarNextDate[i] == null
                                    ? SizedBox()
                                    : _.listCalendarNextDate[i].length > 0 
                                      ? itemDay(
                                        'Próx.citas',
                                        _.listCalendarNextDate[i].length,
                                        Colors.pinkAccent,
                                      )
                                      : SizedBox(),
                                  _.listCalendarEvent[i] == null
                                    ? SizedBox()
                                    : _.listCalendarEvent[i].length > 0 
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
            ),
          ],
        );
      },
    );  
  }
}

Widget itemDay(String tipo, int count, Color color){
  return Container(
    margin: EdgeInsets.all(1.5),
    padding: EdgeInsets.only(top: 1, bottom: 2),
    width: double.maxFinite,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: color,
    ),
    child: 
    Column(
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
          count>99 ? '99+' : '$count',
          style: TextStyle(
            color: Colors.white,
            fontSize: 8,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    ),
  );
}

// Widget fullCalendar({
//   @required int daysPerMonth,
//   @required int month,
//   @required int year,
//   BuildContext context,
// }) {
//   return Column(
//     children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Container(
//             padding: EdgeInsets.only(left: 10,bottom: 2.5),
//             width: (context.width) / 7,
//             child: Text('Lun'),
//           ),
//           Container(
//             padding: EdgeInsets.only(left: 10,bottom: 2.5),
//             width: (context.width) / 7,
//             child: Text('Mar'),
//           ),
//           Container(
//             padding: EdgeInsets.only(left: 10,bottom: 2.5),
//             width: (context.width) / 7,
//             child: Text('Mie'),
//           ),
//           Container(
//             padding: EdgeInsets.only(left: 10,bottom: 2.5),
//             width: (context.width) / 7,
//             child: Text('Jue'),
//           ),
//           Container(
//             padding: EdgeInsets.only(left: 10,bottom: 2.5),
//             width: (context.width) / 7,
//             child: Text('Vie'),
//           ),
//           Container(
//             padding: EdgeInsets.only(left: 10,bottom: 2.5),
//             width: (context.width) / 7,
//             child: Text('Sáb'),
//           ),
//           Container(
//             padding: EdgeInsets.only(left: 10,bottom: 2.5),
//             width: (context.width) / 7,
//             child: Text('Dom'),
//           ),
//         ],
//       ),
//       Wrap(
//         children: [
//           for (var i = 1; i < numWeekDay(year, month, 1); i++)
//             Container(
//               // padding: EdgeInsets.all(2.5),
//               width: (context.width ) / 7,
//               height: 95,
//               child: Container(
//                 color: Colors.grey[200],
//               ),
//             ),
//           for (var i = 0; i < daysPerMonth; i++)
//             Container(
//               width: (context.width ) / 7,
//               height: 95,
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey[200]),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.only(top: 5),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       padding: EdgeInsets.only(left: 5),
//                       child: Text((i + 1).toString()),
//                     ),
//                     SizedBox(height: 2.5),
//                     Container(
//                       width: double.maxFinite,
//                       padding: EdgeInsets.only(right: 5),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           itemDay(109,colorMain),
//                           itemDay(99,Colors.pinkAccent),
//                           itemDay(99,Colors.blueGrey),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             )
//         ],
//       ),
//     ],
//   );
// }

// gradient: LinearGradient(
//   colors: [
//     colorBlue,
//     colorGreen,
//   ],
//   begin: const FractionalOffset(0.0, 0.0),
//   end: const FractionalOffset(1.0, 0.0),
//   stops: [0.0, 1.0],
// ),