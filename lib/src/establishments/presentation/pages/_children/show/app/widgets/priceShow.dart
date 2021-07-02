import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget precio(String tipo, String desde) {
  return Card(
    margin: EdgeInsets.all(8),
    child: Container(
      width: (Get.width / 2) - 20,
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            tipo,
            style: TextStyle(color: Get.textTheme.subtitle2!.color),
          ),
          SizedBox(height: 5),
          Text(
            "desde",
            style: TextStyle(color: Get.textTheme.subtitle2!.color),
          ),
          Text(
            desde,
            style: TextStyle(color: Get.textTheme.subtitle2!.color),
          )
        ],
      ),
    ),
  );
}
