import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/resources/images/images.dart';
import 'package:vet_app/design/styles/styles.dart';

class Portada extends StatelessWidget {
  const Portada({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (context.width / 2) - 100,
      height: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imgPortada),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(color: colorGreen.withOpacity(0.75)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(width: 25.0),
            Text(
              'Be',
              style: TextStyle(
                fontSize: 62,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(width: 20.0),
            RotateAnimatedTextKit(
              repeatForever: true,
              text: ['Carefull', 'Happy', 'Proypet'],
              textStyle: TextStyle(
                fontSize: 62,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
