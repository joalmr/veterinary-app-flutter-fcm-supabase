import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:vet_app/recursos/utils/days/diaSemanaLite.dart';
import 'package:vet_app/recursos/utils/fullCalendar.dart';
import 'package:vet_app/recursos/utils/monthsName.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/calendar/presentation/widgets/eventList/eventsBooking.dart';
import 'package:vet_app/src/calendar/presentation/widgets/eventList/eventsNextDate.dart';
import 'package:vet_app/src/calendar/presentation/widgets/eventList/eventsNote.dart';
import 'package:vet_app/src/home/presentation/pages/web/dashboard/widgets/tabSelect.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

int valueDay = DateTime.now().day;
int valueMonth = DateTime.now().month; //DateTime(2021, 4, 0).month;
int valueYear = DateTime.now().year;

var daysPerMonth = DateTime(valueYear, (valueMonth + 1), 0).day;
int selected = 0;

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Row(
            children: [
              SizedBox(width: 50),
              IconButton(
                icon: Icon(Icons.keyboard_arrow_left_rounded),
                onPressed: () {
                  setState(() {
                    if (valueMonth > 1) {
                      valueMonth = valueMonth - 1;
                      daysPerMonth =
                          DateTime(valueYear, (valueMonth + 1), 0).day;
                      valueDay = 1;
                    } else {
                      valueYear = valueYear - 1;
                      valueMonth = 12;
                      daysPerMonth =
                          DateTime(valueYear, (valueMonth + 1), 0).day;
                    }
                  });
                },
              ),
              Expanded(
                child: Center(
                  child: Text(
                    '${monthsName[valueMonth]}, $valueYear',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.keyboard_arrow_right_rounded),
                onPressed: () {
                  setState(() {
                    if (valueMonth < 12) {
                      valueMonth = valueMonth + 1;
                      daysPerMonth = DateTime(2021, (valueMonth + 1), 0).day;
                      valueDay = 1;
                    } else {
                      valueYear = valueYear + 1;
                      valueMonth = 1;
                      daysPerMonth =
                          DateTime(valueYear, (valueMonth + 1), 0).day;
                    }
                  });
                },
              ),
              SizedBox(width: 50),
            ],
          ),
          SizedBox(height: 15),
          Container(
            // key: _keyBody,
            height: 80,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: daysPerMonth,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                int dayNum = numWeekDay(valueYear, valueMonth, (index + 1));

                bool daySelected = valueDay ==
                    DateTime(valueYear, valueMonth, (index + 1)).day;
                return Container(
                  width: 40,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: daySelected ? colorGreen : Colors.grey[200],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        valueDay = index + 1;
                        print(valueDay);
                      });
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          diaSemanaLite[dayNum - 1],
                          style: TextStyle(
                            color: daySelected ? Colors.white : null,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '${(index + 1)}',
                          style: TextStyle(
                            color: daySelected ? Colors.white : null,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 50),
              InkWell(
                borderRadius: BorderRadius.circular(20.0),
                onTap: () {
                  setState(() {
                    selected = 0;
                  });
                },
                child: tabSelect(
                  selected: selected == 0,
                  text: 'Reservas',
                ),
              ),
              SizedBox(width: 10),
              InkWell(
                borderRadius: BorderRadius.circular(20.0),
                onTap: () {
                  setState(() {
                    selected = 1;
                  });
                },
                child: tabSelect(
                  selected: selected == 1,
                  text: 'Próximas citas',
                ),
              ),
              SizedBox(width: 10),
              InkWell(
                borderRadius: BorderRadius.circular(20.0),
                onTap: () {
                  setState(() {
                    selected = 2;
                  });
                },
                child: tabSelect(
                  selected: selected == 2,
                  text: 'Eventos',
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          ConditionalSwitch.single<int>(
            context: context,
            valueBuilder: (BuildContext context) => selected,
            caseBuilders: {
              0: (BuildContext context) => EventsBooking(),
              1: (BuildContext context) => EventsNextDate(),
              2: (BuildContext context) => EventsNote(),
            },
            fallbackBuilder: (BuildContext context) => EventsBooking(),
          ),
        ],
      ),
    );
  }
}
