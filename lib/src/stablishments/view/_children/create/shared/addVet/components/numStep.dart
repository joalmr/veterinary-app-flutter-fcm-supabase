import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';

class NumStep extends StatelessWidget {
  final int selected;
  const NumStep({
    Key key,
    @required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: colorGreen,
      ),
      child: Center(
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey[100]),
          child: Center(
            child: Text(
              '$selected / 4',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
