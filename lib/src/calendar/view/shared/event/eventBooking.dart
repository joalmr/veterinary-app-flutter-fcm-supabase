import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/childRegion.dart';
import 'package:vet_app/design/styles/styles.dart';

class EventBooking extends StatelessWidget {
  final Color color;
  final String image;
  final String petName;
  final String petBreed;
  final String time;
  final String userName;
  final String status;

  const EventBooking({
    Key key,
    @required this.color,
    @required this.image,
    @required this.petName,
    @required this.petBreed,
    @required this.time,
    @required this.userName,
    @required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: context.width > 900 ? 40 : 15,
        right: context.width > 900 ? 20 : 10,
        top: 5,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
      child: ChildRegion(
        margin: EdgeInsets.only(left: 10),
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image(
                height: context.width > 900 ? 80 : 75,
                width: context.width > 900 ? 80 : 55,
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
            SizedBox(width: context.width > 900 ? 20 : 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  petName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  petBreed,
                ),
                Text(
                  time,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colorMain,
                  ),
                ),
                Text(
                  userName,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      height: 7.5,
                      width: 7.5,
                    ),
                    SizedBox(width: 5),
                    Text(
                      status,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
