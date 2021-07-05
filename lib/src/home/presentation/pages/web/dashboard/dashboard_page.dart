import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:vet_app/components/subheader.dart';

import 'widgets/row_future.dart';
import 'widgets/row_pass.dart';
import 'widgets/row_today.dart';
import 'widgets/tab_select.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

int selected = 1;

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30.0, top: 25.0, bottom: 10.0),
            child: const Text(
              'Dashboard',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          subHeader(title: 'Reservas por atender'),
          Container(
            margin: const EdgeInsets.only(left: 32.0),
            child: Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(20.0),
                  onTap: () {
                    setState(() {
                      selected = 0;
                    });
                  },
                  child: tabSelect(
                    selected: selected == 0,
                    text: 'Vencidas',
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(20.0),
                  onTap: () {
                    setState(() {
                      selected = 1;
                    });
                  },
                  child: tabSelect(
                    selected: selected == 1,
                    text: 'Hoy',
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(20.0),
                  onTap: () {
                    setState(() {
                      selected = 2;
                    });
                  },
                  child: tabSelect(
                    selected: selected == 2,
                    text: 'Próximas atenciones',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ConditionalSwitch.single<int>(
            context: context,
            valueBuilder: (BuildContext context) => selected,
            caseBuilders: {
              0: (BuildContext context) => RowPass(),
              1: (BuildContext context) => RowToday(),
              2: (BuildContext context) => RowFuture(),
            },
            fallbackBuilder: (BuildContext context) => RowToday(),
          ),
        ],
      ),
    );
  }
}
