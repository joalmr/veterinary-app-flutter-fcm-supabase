import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';

class HeaderStep extends StatelessWidget {
  final int selected;
  const HeaderStep({
    Key? key,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ConditionalSwitch.single<int>(
        context: context,
        valueBuilder: (BuildContext context) => selected,
        caseBuilders: {
          1: (BuildContext context) => Text(
                'Step $selected',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
          2: (BuildContext context) => Text(
                'Step $selected',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
          3: (BuildContext context) => Text(
                'Step $selected',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
          4: (BuildContext context) => Text(
                'Step $selected',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
        },
        fallbackBuilder: (BuildContext context) => SizedBox(height: 0),
      ),
    );
  }
}
