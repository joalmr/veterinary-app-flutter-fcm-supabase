import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/calendar/domain/calendarController.dart';
import 'package:vet_app/src/calendar/presentation/widgets/fullCalendar.dart';
import 'package:vet_app/resources/utils/monthsName.dart';

class CalendarEventView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<CalendarController>(
      builder: (_){
        return 
        _.cargando.value
         ? Center(
            child: CircularProgressIndicator(),
          )
         : Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 20),
                    IconButton(
                      icon: Icon(Icons.keyboard_arrow_left_rounded),
                      onPressed: _.monthLess,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          '${monthsName[_.valueMonth.value]}, ${_.valueYear.value}',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.keyboard_arrow_right_rounded),
                      onPressed: _.monthMore,
                    ),
                    SizedBox(width: 20),
                  ],
                ),
                SizedBox(height: 15),
                FullCalendar(),
                // fullCalendar(
                //   context: context,
                //   daysPerMonth: daysPerMonth, 
                //   month: valueMonth, 
                //   year: valueYear, 
                // ),
                // Container(
                //   height: 60,
                //   margin: EdgeInsets.symmetric(horizontal: 10),
                //   child: ScrollablePositionedList.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: daysPerMonth,
                //     itemBuilder: (context, index) {
                //       var dayNum =
                //           DateTime(valueYear, valueMonth, (index + 1)).weekday;
                //       bool daySelected = valueDay ==
                //           DateTime(valueYear, valueMonth, (index + 1)).day;

                //       return Container(
                //         width: 40,
                //         margin: EdgeInsets.symmetric(horizontal: 5),
                //         decoration: BoxDecoration(
                //           color: daySelected ? colorGreen : Colors.grey[200],
                //           borderRadius: BorderRadius.circular(50),
                //         ),
                //         child: InkWell(
                //           onTap: () {
                //             setState(() {
                //               valueDay = index + 1;
                //               print(valueDay);
                //             });
                //           },
                //           borderRadius: BorderRadius.circular(50),
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //               Text(
                //                 diaSemanaLite[dayNum - 1],
                //                 style: TextStyle(
                //                   color: daySelected ? Colors.white : null,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //               SizedBox(height: 5),
                //               Text(
                //                 '${(index + 1)}',
                //                 style: TextStyle(
                //                   color: daySelected ? Colors.white : null,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //     initialScrollIndex: scrollInit,
                //     itemScrollController: itemScrollController,
                //     itemPositionsListener: itemPositionsListener,
                //   ),
                // ),
                // SizedBox(height: 20),
                // Row(
                //   children: [
                //     SizedBox(width: 50),
                //     InkWell(
                //       borderRadius: BorderRadius.circular(20.0),
                //       onTap: () {
                //         setState(() {
                //           selected = 0;
                //         });
                //       },
                //       child: tabSelect(
                //         selected: selected == 0,
                //         text: 'Reservas',
                //       ),
                //     ),
                //     SizedBox(width: 10),
                //     InkWell(
                //       borderRadius: BorderRadius.circular(20.0),
                //       onTap: () {
                //         setState(() {
                //           selected = 1;
                //         });
                //       },
                //       child: tabSelect(
                //         selected: selected == 1,
                //         text: 'Próximas citas',
                //       ),
                //     ),
                //     SizedBox(width: 10),
                //     InkWell(
                //       borderRadius: BorderRadius.circular(20.0),
                //       onTap: () {
                //         setState(() {
                //           selected = 2;
                //         });
                //       },
                //       child: tabSelect(
                //         selected: selected == 2,
                //         text: 'Eventos',
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 10),
                // ConditionalSwitch.single<int>(
                //   context: context,
                //   valueBuilder: (BuildContext context) => selected,
                //   caseBuilders: {
                //     0: (BuildContext context) => EventsBooking(),
                //     1: (BuildContext context) => EventsNextDate(),
                //     2: (BuildContext context) => EventsNote(),
                //   },
                //   fallbackBuilder: (BuildContext context) => EventsBooking(),
                // ),
              ],
            ),
          ),
        );
      },
    );
    
  }
}
