import 'package:flutter/material.dart';

Widget tabSelect({required bool selected, required String text}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: selected
        ? Container(
            height: 25.0,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        : Container(
            height: 25.0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
          ),
  );
}
