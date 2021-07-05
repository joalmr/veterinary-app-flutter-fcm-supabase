import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:vet_app/src/home/presentation/pages/web/dashboard/widgets/tab_select.dart';

import 'widgets/view_future.dart';
import 'widgets/view_pass.dart';
import 'widgets/view_today.dart';

class AtenderView extends StatefulWidget {
  const AtenderView({Key? key}) : super(key: key);

  @override
  _AtenderViewState createState() => _AtenderViewState();
}

int selected = 1;

class _AtenderViewState extends State<AtenderView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20.0, top: 15, bottom: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
            0: (BuildContext context) => ViewPass(),
            1: (BuildContext context) => ViewToday(),
            2: (BuildContext context) => ViewFuture(),
          },
          fallbackBuilder: (BuildContext context) => ViewToday(),
        ),
      ],
    );
  }
}
