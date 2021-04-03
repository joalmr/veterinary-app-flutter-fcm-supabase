import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/assets/utils/icons_map.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              left: 10.0,
              right: 0.0,
              bottom: 5.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Servicios",
                  style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2),
                ),
                IconButton(
                  splashRadius: 20,
                  iconSize: 18,
                  icon: Icon(
                    Icons.edit,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          for (var i = 0; i < 10; i++)
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Get.theme.backgroundColor, //Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 3.0,
                            spreadRadius: 2.0)
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        iconNum[1],
                        size: 20,
                        color: Get.textTheme.subtitle2.color,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    textMap[1],
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
