import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChildRegion extends StatefulWidget {
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const ChildRegion({
    this.child,
    this.margin,
    this.padding,
  });

  @override
  _ChildRegionState createState() => _ChildRegionState();
}

class _ChildRegionState extends State<ChildRegion> {
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
        duration: const Duration(milliseconds: 275),
        margin: widget.margin,
        padding: widget.padding,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: hovered
                ? [
                    const BoxShadow(
                      color: Colors.black12,
                      blurRadius: 13.0,
                      spreadRadius: 0.0,
                    ),
                  ]
                : []),
        child: widget.child,
      ),
    );
  }
}
