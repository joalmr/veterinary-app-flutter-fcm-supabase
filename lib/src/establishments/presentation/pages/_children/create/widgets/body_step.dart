import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/app/steps/step1.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/app/steps/step2.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/app/steps/step3.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/app/steps/step4.dart';

class BodyStep extends StatelessWidget {
  final int selected;
  const BodyStep({
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return ConditionalSwitch.single<int>(
      context: context,
      valueBuilder: (BuildContext context) => selected,
      caseBuilders: {
        1: (BuildContext context) => Step1(),
        2: (BuildContext context) => Step2(),
        3: (BuildContext context) => Step3(),
        4: (BuildContext context) => Step4(),
      },
      fallbackBuilder: (BuildContext context) => Step1(),
    );
  }
}
