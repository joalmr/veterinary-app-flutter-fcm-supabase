import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
// import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/icons/proypet_icons.dart';
import 'package:vet_app/src/bookings/presentation/pages/reprogramar/app/reprogramar.dart';
import 'package:vet_app/src/home/domain/homeController.dart';

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
  final List<String> bookingServices;
  final String observation;
  final String address;
  final String delivery;

  const CardBooking({
    required this.bookingId,
    required this.petImg,
    required this.petName,
    required this.petBreed,
    required this.status,
    required this.date,
    required this.time,
    required this.userName,
    required this.userPhone,
    required this.color,
    required this.bookingServices,
    required this.observation,
    required this.address,
    required this.delivery,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController _home = Get.find();
    String stringTypes = '';
    for (var i = 0; i < bookingServices.length; i++) {
      final element = bookingServices[i];
      if (bookingServices.length == 1) {
        stringTypes = element;
      } else {
        if (i < bookingServices.length - 1) {
          stringTypes += '$element, ';
        } else {
          stringTypes += element;
        }
      }
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
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
                        padding: const EdgeInsets.all(20.0),
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
                                      image:
                                          CachedNetworkImageProvider(petImg)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    petName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(petBreed),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                      const SizedBox(width: 5),
                                      Text(
                                        status,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '$date $time',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(LineIcons.whatSApp
                                  // LineAwesomeIcons.whatsapp
                                  ),
                              color: colorMain,
                              iconSize: 40,
                              onPressed: () {
                                _home.launchWhatsApp(
                                  userPhone,
                                  userName,
                                  petName,
                                  date,
                                  time,
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Usuario',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(userName),
                            Text(userPhone),
                            const SizedBox(height: 5),
                            const Text(
                              'Tipo',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(stringTypes),
                            const SizedBox(height: 5),
                            const Text(
                              'Observaciones',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              observation == '' ? '-' : observation,
                              maxLines: 5,
                            ),
                            const SizedBox(height: 5),
                            if (delivery != '' && address != '')
                              Card(
                                color: Colors.grey[200],
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  width: double.maxFinite,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(IconProypet.delivery),
                                      const SizedBox(height: 5),
                                      Text(
                                        delivery,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(address),
                                    ],
                                  ),
                                ),
                              )
                            else
                              const SizedBox(height: 0)
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 7.5),
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
                              padding:
                                  const EdgeInsets.only(left: 7.5, right: 20),
                              child: btnSecondary(
                                text: 'Reprogramar',
                                color: Colors.grey[600]!,
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
              style: const TextStyle(
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
                const SizedBox(width: 5),
                Text(
                  status,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: Row(
                children: const [
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
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            ),
            Text(
              time,
              style: const TextStyle(
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
