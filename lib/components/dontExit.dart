import 'package:flutter/material.dart';

class DontExit extends StatelessWidget {
  final child;

  const DontExit({required this.child});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        DateTime? currentBackPressTime;
        DateTime now = DateTime.now();
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime) > Duration(seconds: 2)) {
          currentBackPressTime = now;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Presione salir dos veces'),
            duration: Duration(seconds: 3),
            backgroundColor: Colors.black.withOpacity(0.85),
          ));
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: child,
    );
  }
}
