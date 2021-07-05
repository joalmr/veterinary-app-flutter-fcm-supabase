import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/link.dart';
import 'package:vet_app/design/styles/styles.dart';

class CheckRegister extends StatefulWidget {
  final String? title;
  final String? link;
  final String? tipo;

  CheckRegister({
    this.title,
    this.link,
    this.tipo,
  });

  @override
  _CheckRegisterState createState() => _CheckRegisterState();
}

class _CheckRegisterState extends State<CheckRegister> {
  bool valueCheck = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, top: 2.5, bottom: 2.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                valueCheck = !valueCheck;
              });
            },
            borderRadius: BorderRadius.circular(5),
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: valueCheck
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
          ),
          SizedBox(width: 7.5),
          Wrap(
            alignment: WrapAlignment.start,
            children: [
              Text(
                widget.title!,
              ),
              Link(
                uri: Uri.parse(
                  widget.tipo == 'tyc'
                      ? 'http://danger.proypet.com/terminos'
                      : 'http://danger.proypet.com/politicas',
                ),
                builder: (_, link) {
                  return GestureDetector(
                    onTap: link,
                    child: Text(
                      widget.link!,
                      style: TextStyle(color: colorBlue),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
