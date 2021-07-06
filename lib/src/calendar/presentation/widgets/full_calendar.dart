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
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 2.5),
                  width: (context.width) / 7,
                  child: const Text('Lun'),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 2.5),
                  width: (context.width) / 7,
                  child: const Text('Mar'),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 2.5),
                  width: (context.width) / 7,
                  child: const Text('Mie'),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 2.5),
                  width: (context.width) / 7,
                  child: const Text('Jue'),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 2.5),
                  width: (context.width) / 7,
                  child: const Text('Vie'),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 2.5),
                  width: (context.width) / 7,
                  child: const Text('Sáb'),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 2.5),
                  width: (context.width) / 7,
                  child: const Text('Dom'),
                ),
              ],
            ),
            Wrap(
              children: [
                for (var i = 1;
                    i < numWeekDay(_.valueYear.value, _.valueMonth.value, 1);
                    i++)
                  SizedBox(
                    width: (context.width) / 7,
                    height: 100,
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
                        listaBooking.addAll(
                            _.listCalendarBooking[i] as Iterable<dynamic>);
                      }
                      if (_.listCalendarNextDate[i] != null) {
                        listaNextDate.addAll(
                            _.listCalendarNextDate[i] as Iterable<dynamic>);
                      }
                      if (_.listCalendarEvent[i] != null) {
                        listaEvent.addAll(
                            _.listCalendarEvent[i] as Iterable<dynamic>);
                      }
                      Get.to(DayDetail(
                        day: formatDate(dateDet),
                        listaBooking: listaBooking,
                        listaNextDate: listaNextDate,
                        listaEvent: listaEvent,
                      ));
                    },
                    child: Container(
                      width: (context.width) / 7,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text('$i'),
                            ),
                            const SizedBox(height: 2.5),
                            SizedBox(
                              width: double.maxFinite,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  if (_.listCalendarBooking[i] == null)
                                    const SizedBox()
                                  else
                                    _.listCalendarBooking[i].length > 0
                                        ? itemDay(
                                            'Atenciones',
                                            _.listCalendarBooking[i].length,
                                            colorMain,
                                          )
                                        : const SizedBox(),
                                  if (_.listCalendarNextDate[i] == null)
                                    const SizedBox()
                                  else
                                    (_.listCalendarNextDate[i].length > 0)
                                        ? itemDay(
                                            'Próx.citas',
                                            _.listCalendarNextDate[i].length,
                                            Colors.pinkAccent,
                                          )
                                        : const SizedBox(),
                                  if (_.listCalendarEvent[i] == null)
                                    const SizedBox()
                                  else
                                    _.listCalendarEvent[i].length > 0
                                        ? itemDay(
                                            'Eventos',
                                            _.listCalendarEvent[i].length,
                                            Colors.blueGrey,
                                          )
                                        : const SizedBox(),
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

Widget itemDay(String tipo, int count, Color color) {
  return Container(
    margin: const EdgeInsets.all(1.5),
    padding: const EdgeInsets.only(top: 1, bottom: 2),
    width: double.maxFinite,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: color,
    ),
    child: Column(
      children: [
        Text(
          tipo,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 8,
          ),
        ),
        const SizedBox(height: .5),
        Text(
          count > 99 ? '99+' : '$count',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 8,
            fontWeight: FontWeight.bold,
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
