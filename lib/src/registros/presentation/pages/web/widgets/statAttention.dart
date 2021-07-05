import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vet_app/components/childRegion.dart';

class StatAttention extends StatefulWidget {
  final String? text;
  final String? value;
  final IconData? icon;
  final Color? color;

  const StatAttention({
    this.text,
    this.value,
    this.icon,
    this.color,
  });

  @override
  _StatAttentionState createState() => _StatAttentionState();
}

class _StatAttentionState extends State<StatAttention> {
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
      child: ChildRegion(
        margin: const EdgeInsets.only(bottom: 15.0, left: 5, right: 5),
        child: Container(
          width: 200,
          height: 65,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5.0,
                    ),
                    Container(
                      height: 38.0,
                      width: 38.0,
                      decoration: BoxDecoration(
                        color: widget.color!.withOpacity(0.75),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(
                              widget.icon,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.text!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          widget.value!,
                          style: const TextStyle(
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
