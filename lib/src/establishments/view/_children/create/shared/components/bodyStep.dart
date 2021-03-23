import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:vet_app/src/establishments/view/_children/create/shared/steps/step1.dart';
import 'package:vet_app/src/establishments/view/_children/create/shared/steps/step2.dart';
import 'package:vet_app/src/establishments/view/_children/create/shared/steps/step3.dart';
import 'package:vet_app/src/establishments/view/_children/create/shared/steps/step4.dart';

class BodyStep extends StatelessWidget {
  final int selected;
  const BodyStep({
    Key key,
    @required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ConditionalSwitch.single<int>(
        context: context,
        valueBuilder: (BuildContext context) => selected,
        caseBuilders: {
          1: (BuildContext context) => Step1(),
          2: (BuildContext context) => Step2(),
          3: (BuildContext context) => Step3(),
          4: (BuildContext context) => Step4(),
          // 6: (BuildContext context) => Step6(),
        },
        fallbackBuilder: (BuildContext context) => Step1(),
      ),
    );
  }
}
