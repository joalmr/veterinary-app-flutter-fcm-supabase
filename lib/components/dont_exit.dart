import 'package:flutter/material.dart';

class DontExit extends StatelessWidget {
  final Widget child;

  const DontExit({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        DateTime? currentBackPressTime;
        final DateTime now = DateTime.now();
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
          currentBackPressTime = now;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Presione salir dos veces'),
            duration: const Duration(seconds: 3),
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
