import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vet_app/design/styles/styles.dart';

class CheckFiltro extends StatefulWidget {
  final String title;
  final Function() onTapFn;
  final bool checkBool;

  const CheckFiltro({
    required this.title,
    required this.onTapFn,
    required this.checkBool,
  });

  @override
  _CheckFiltroState createState() =>
      _CheckFiltroState(title: title, checkBool: checkBool, onTapFn: onTapFn);
}

class _CheckFiltroState extends State<CheckFiltro> {
  String title;
  Function() onTapFn;
  bool checkBool;
  _CheckFiltroState(
      {required this.title, required this.checkBool, required this.onTapFn});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          checkBool = !checkBool;
          widget.onTapFn();
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.5),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: checkBool
                  ? const Icon(
                      Icons.check_box_rounded,
                      color: colorMain,
                      size: 22,
                    )
                  : const Icon(
                      Icons.check_box_outline_blank_rounded,
                      color: colorMain,
                      size: 22,
                    ),
            ),
            const SizedBox(width: 7.5),
            Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                // fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
