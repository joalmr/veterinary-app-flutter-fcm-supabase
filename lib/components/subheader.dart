import 'package:flutter/material.dart';

Widget subHeader({@required title}) {
  return Container(
    margin: EdgeInsets.only(
      left: 30.0,
      right: 30.0,
      top: 5.0,
      bottom: 15.0,
    ),
    child: Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14.0,
      ),
    ),
  );
}
