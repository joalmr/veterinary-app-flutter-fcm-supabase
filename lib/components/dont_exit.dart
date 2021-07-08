import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DontExit extends StatefulWidget {
  final Widget child;

  const DontExit({Key? key, required this.child}) : super(key: key);

  @override
  _DontExitState createState() => _DontExitState();
}

class _DontExitState extends State<DontExit> {
  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    final DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Presione salir dos veces'),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.black.withOpacity(0.85),
      ));
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return GetPlatform.isWeb
        ? widget.child
        : WillPopScope(
            onWillPop: () => onWillPop(),
            child: widget.child,
          );
  }
}
