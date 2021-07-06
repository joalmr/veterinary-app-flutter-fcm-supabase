import 'package:flutter/material.dart';

//TODO: REVISAR LOS DEMAS FUNCTION
Widget navbarItem(
    {required bool active,
    required IconData icon,
    void Function()? onTap,
    Color? color}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onTap,
      splashColor: Colors.white,
      hoverColor: Colors.white12,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3.0),
        child: Row(
          children: [
            SizedBox(
              height: 60.0,
              width: 80.0,
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 475),
                    height: 35.0,
                    width: 5.0,
                    decoration: BoxDecoration(
                      color: active ? Colors.white : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: color != null
                        ? Icon(
                            icon,
                            color: color,
                            size: 19.0,
                          )
                        : Icon(
                            icon,
                            color: active ? Colors.white : Colors.white54,
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
