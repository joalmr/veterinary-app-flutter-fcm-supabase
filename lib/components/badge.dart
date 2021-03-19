import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

Widget badge({String name, int count = 0}) {
  return Badge(
    child: Text(name),
    alignment: Alignment.center,
    badgeContent: Text(
      count > 99 ? '+99' : '$count',
      style: TextStyle(fontSize: 10, color: Colors.white),
    ),
    badgeColor: Colors.red,
    position: BadgePosition.bottomEnd(end: -22.5),
  );
}
