import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatContent extends StatefulWidget {
  final String text;
  final IconData icon;
  final String value;
  final Color color;

  StatContent({
    this.text,
    this.icon,
    this.value,
    this.color,
  });

  @override
  _StatContentState createState() => _StatContentState();
}

class _StatContentState extends State<StatContent> {
  bool hovered = false;
  bool hovConfirma = false;
  bool hovReprograma = false;
  bool activeReprogramar = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          hovered = true;
        });
      },
      onExit: (value) {
        setState(() {
          hovered = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 275),
        margin: EdgeInsets.only(bottom: 15.0, left: 5, right: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: hovered
                ? [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 13.0,
                      spreadRadius: 0.0,
                    ),
                  ]
                : []),
        child: Container(
          width: 200,
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SizedBox(width: 5.0),
                    Container(
                      height: 38.0,
                      width: 38.0,
                      decoration: BoxDecoration(
                        color: widget.color,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              widget.icon,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.text,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          widget.value,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                          ),
                        ),
                      ],
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
}
