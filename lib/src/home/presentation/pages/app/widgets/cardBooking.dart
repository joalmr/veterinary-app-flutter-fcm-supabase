import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/home/domain/homeController.dart';
import 'package:vet_app/src/home/presentation/pages/app/acttionBooking/reprogramar.dart';

class CardBooking extends StatelessWidget {
  final String bookingId;
  final String petImg;
  final String petName;
  final String petBreed;
  final String status;
  final String date;
  final String time;
  final String userName;
  final String userPhone;
  final Color color;
  final String types;
  final String observation;

  const CardBooking({
    Key key,
    this.bookingId,
    this.petImg,
    this.petName,
    this.petBreed,
    this.status,
    this.date,
    this.time,
    this.userName,
    this.userPhone,
    this.color,
    this.types,
    this.observation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController _home = Get.find();

    // String petImage = 'https://danger.proypet.com/' +
    //     petImg.split('http://18.188.214.204/')[1];

    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Container(
                              height: 68.0,
                              width: 68.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image(
                                    fit: BoxFit.cover,
                                    image: petImg != null
                                        ? CachedNetworkImageProvider(petImg)
                                        : AssetImage('assets/images/dog.jpg'),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  petName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(petBreed),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: color,
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      height: 7.5,
                                      width: 7.5,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      status,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '$date $time',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 0,
                          bottom: 20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Usuario',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              userName,
                              style: TextStyle(),
                            ),
                            Text(
                              userPhone,
                              style: TextStyle(),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Tipo',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              types,
                              style: TextStyle(),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Observaciones',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              observation,
                              style: TextStyle(),
                              maxLines: 5,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20, right: 7.5),
                              child: btnSecondary(
                                text: 'Confirmar',
                                onPressed: () {
                                  _home.confirm(bookingId);
                                  Get.back();
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 7.5, right: 20),
                              child: btnSecondary(
                                text: 'Reprogramar',
                                color: Colors.grey[600],
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return ReprogramarItem(
                                        bookingId: bookingId,
                                        petImg: petImg,
                                        petName: petName,
                                        petBreed: petBreed,
                                        date: date,
                                        time: time,
                                        userName: userName,
                                        userPhone: userPhone,
                                        color: color,
                                        status: status,
                                      );
                                    }),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        leading: Container(
          height: 58.0,
          width: 58.0,
          decoration: BoxDecoration(
            // color: color,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image(
                  fit: BoxFit.cover, image: CachedNetworkImageProvider(petImg)),
            ),
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              petName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(petBreed),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.expand_more_rounded,
                    size: 14,
                    color: colorMain,
                  ),
                  Text(
                    'Ver más',
                    style: TextStyle(
                      color: colorMain,
                      fontSize: 12.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              date,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            ),
            Text(
              time,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
