import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vet_app/design/styles/styles.dart';

class CheckFiltro extends StatefulWidget {
  final String title;

  CheckFiltro({
    this.title,
  });

  @override
  _CheckFiltroState createState() => _CheckFiltroState();
}

class _CheckFiltroState extends State<CheckFiltro> {
  bool valueCheck = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          valueCheck = !valueCheck;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: valueCheck
                  ? Icon(
                      Icons.check_box_rounded,
                      color: colorMain,
                      size: 22,
                    )
                  : Icon(
                      Icons.check_box_outline_blank_rounded,
                      color: colorMain,
                      size: 22,
                    ),
            ),
            SizedBox(width: 7.5),
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                // fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );

    // CheckboxListTile(
    //   controlAffinity: ListTileControlAffinity.leading,
    //   title: Text(widget.title),
    //   value: valueCheck,
    //   onChanged: (bool value) {
    //     setState(() {
    //       valueCheck = value;
    //     });
    //   },
    // );
  }
}
