import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vet_app/design/styles/styles.dart';

class CheckFiltro extends StatefulWidget {
  final String title;
  final Function() onTapFn;
  final bool checkBool;

  CheckFiltro({
    @required this.title,
    @required this.onTapFn,
    @required this.checkBool,
  });

  @override
  _CheckFiltroState createState() => _CheckFiltroState(title: this.title, checkBool: this.checkBool, onTapFn: this.onTapFn) ;
}

class _CheckFiltroState extends State<CheckFiltro> {
  String title;
  Function() onTapFn;
  bool checkBool;
  _CheckFiltroState({@required this.title,@required this.checkBool,@required this.onTapFn});

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
        padding: EdgeInsets.symmetric(vertical: 2.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: checkBool
                  ? Icon(
                      Icons.check_box_rounded,
                      color: colorMain,
                      size: 22,
                    )
                  : Icon(
                      Icons.check_box_outline_blank_rounded,
                      color: colorMain,
                      size: 22,
                    ),
            ),
            SizedBox(width: 7.5),
            Text(
              widget.title,
              style: TextStyle(
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
