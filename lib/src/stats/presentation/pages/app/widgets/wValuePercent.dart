import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget wValuePercent({
  Color? color,
  required String count,
  required String name,
  required double progress,
  Color colorData = Colors.white,
}) {
  String porcentaje = (progress * 100).toStringAsFixed(0);

  return Container(
    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    height: 85.0,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                count,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  // color: colorData,
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w500,
                  // color: colorData,
                ),
              ),
              SizedBox(height: 8.0),
              // Text(
              //   descriptions,
              //   style: TextStyle(
              //     fontSize: 10.0,
              //     color: Colors.white,
              //   ),
              // ),
            ],
          ),
        ),
        CircularPercentIndicator(
          radius: 55.0,
          lineWidth: 4.5,
          percent: progress,
          circularStrokeCap: CircularStrokeCap.round,
          center: Text(
            '$porcentaje%',
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w700,
              color: colorData,
            ),
          ),
          progressColor: colorData,
          startAngle: 270,
          backgroundColor: colorData.withOpacity(0.54),
        ),
      ],
    ),
  );
}
