import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vet_app/design/styles/styles.dart';

class NewEstablishment extends StatelessWidget {
  const NewEstablishment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/images/call-green.png'),
            height: 250,
            fit: BoxFit.cover,
          ),
          Text('Descargue nuestro aplicativo para crear su veterinaria!'),
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => launch(
                'https://play.google.com/store/apps/details?id=com.proypet.vet'),
            child: Image(
              height: 200,
              fit: BoxFit.cover,
              image: AssetImage('assets/images/google-play.png'),
            ),
          ),
          // InkWell(
          //   borderRadius: BorderRadius.circular(10),
          //   onTap: () =>
          //       launch('https://apps.apple.com/pe/app/proypet/id1529231253'),
          //   child: Image(
          //     image: AssetImage('assets/images/app-store.png'),
          //   ),
          // ),
          Text(
            'info@proypet.com',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: colorMain,
            ),
          ),
        ],
      ),
    );
  }
}
