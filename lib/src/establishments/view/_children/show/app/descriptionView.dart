import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescriptionView extends StatelessWidget {
  final String description;
  const DescriptionView({Key key, @required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool editDescription = false;
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
                  "Descripción",
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
          !editDescription
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    description,
                    textAlign: TextAlign.justify,
                  ),
                )
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Descripción'),
                      TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        maxLines: 10,
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
