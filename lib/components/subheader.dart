import 'package:flutter/material.dart';

Widget subHeader({required String title}) {
  return Container(
    margin: const EdgeInsets.only(
      left: 30.0,
      right: 30.0,
      top: 5.0,
      bottom: 15.0,
    ),
    child: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14.0,
      ),
    ),
  );
}
