import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget chartDesign({
  required String title,
  required Widget widget,
  Color colorFondo = Colors.white,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: colorFondo,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: Get.context!.width < 900
          ? <Widget>[widget]
          : <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              widget,
            ],
    ),
  );
}
