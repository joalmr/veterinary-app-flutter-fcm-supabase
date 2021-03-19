import 'package:flutter/material.dart';

Widget navbarItem({bool active, IconData icon, Function onTap, Color color}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onTap,
      splashColor: Colors.white,
      hoverColor: Colors.white12,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 3.0),
        child: Row(
          children: [
            Container(
              height: 60.0,
              width: 80.0,
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 475),
                    height: 35.0,
                    width: 5.0,
                    decoration: BoxDecoration(
                      color: active ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Icon(
                      icon,
                      color: color != null
                          ? color
                          : active
                              ? Colors.white
                              : Colors.white54,
                      size: 19.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
