import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vet_app/components/childRegion.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class EventNextDate extends StatelessWidget {
  final String image;
  final String petName;
  final String petBreed;
  final String motivo;
  final String userName;
  final String userPhone;
  final bool firstPush;
  final bool secondPush;

  const EventNextDate({
    required this.image,
    required this.petName,
    required this.petBreed,
    required this.motivo,
    required this.userName,
    required this.userPhone,
    required this.firstPush,
    required this.secondPush,
  });

  launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+51$userPhone',
      text: '''
Hola $userName somos de ${prefUser.vetName}, nos comunicamos por su cita pendiente de $petName, no olvide reserva por medio de la app Proypet''',
    );
    await launch('$link');
  }

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
        color: Colors.pinkAccent,
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
                image: CachedNetworkImageProvider(image),
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
                Text(petBreed),
                Text(
                  motivo,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colorMain,
                  ),
                ),
                Text(userName),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 75),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Icon(Icons.book_rounded),
                            style:
                                TextButton.styleFrom(primary: Colors.black38),
                          ),
                          TextButton(
                            onPressed: () {
                              print('wsp');
                              print(userPhone);
                              launchWhatsApp();
                            },
                            child: Icon(
                              // LineAwesomeIcons.whatsapp,
                              LineIcons.whatSApp,
                              size: 32,
                            ),
                          ),
                        ],
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
