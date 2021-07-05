import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/child_region.dart';
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
    Key? key,
    required this.color,
    required this.image,
    required this.petName,
    required this.petBreed,
    required this.time,
    required this.userName,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color colorStatus = Colors.lightGreen;
    switch (status) {
      case 'Atendido':
        colorStatus = Colors.black;
        break;
      case 'Confirmado':
        colorStatus = colorMain;
        break;
      case 'Por confirmar':
        colorStatus = Colors.deepPurple[200]!;
        break;
      default:
        colorStatus = Colors.lightGreen;
        break;
    }
    return Container(
      margin: EdgeInsets.only(
        left: context.width > 900 ? 40 : 15,
        right: context.width > 900 ? 20 : 10,
        top: 5,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colorStatus,
      ),
      child: ChildRegion(
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image(
                height: context.width > 900 ? 80 : 75,
                width: context.width > 900 ? 80 : 55,
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(image), //AssetImage(image),
              ),
            ),
            SizedBox(width: context.width > 900 ? 20 : 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  petName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(petBreed),
                Text(
                  time,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colorMain,
                  ),
                ),
                Text(userName),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: colorStatus,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      height: 7.5,
                      width: 7.5,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      status,
                      style: const TextStyle(
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
