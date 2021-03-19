import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';

Widget btnPrimary({
  @required String text,
  @required Function onPressed,
}) {
  return TextButton(
    child: Text(text),
    onPressed: onPressed,
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      textStyle: TextStyle(fontWeight: FontWeight.bold),
      backgroundColor: colorMain,
      primary: Colors.white,
    ),
  );
}

Widget btnSecondary({
  @required String text,
  @required Function onPressed,
  Color color = colorMain,
}) {
  return TextButton(
    child: Text(text),
    onPressed: onPressed,
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      alignment: Alignment.center,
      primary: color,
      // textStyle: TextStyle(fontWeight: FontWeight.bold),
      side: BorderSide(color: color),
    ),
  );
}

Widget btnAltern({
  @required String text,
  @required Function onPressed,
  Color color = Colors.black54,
  bool bold = false,
}) {
  return TextButton(
    child: Text(text),
    onPressed: onPressed,
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      textStyle: TextStyle(
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
      primary: color,
    ),
  );
}
