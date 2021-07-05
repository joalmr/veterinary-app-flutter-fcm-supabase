import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';

class AtenderMascota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/images/dog.jpg'),
                ),
                Text(
                  'Pipo',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Text(
                  'Mestizo',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Atender',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w200),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            width: double.maxFinite,
            height: 100,
            decoration: BoxDecoration(
              color: colorMain,
              borderRadius: BorderRadius.circular(16),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: colorMain.withOpacity(0.5),
                  offset: const Offset(1.1, 1.1),
                  blurRadius: 10,
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'Atender ahora',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            width: double.maxFinite,
            height: 100,
            decoration: BoxDecoration(
              color: colorMain,
              borderRadius: BorderRadius.circular(16),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: colorMain.withOpacity(0.5),
                  offset: const Offset(1.1, 1.1),
                  blurRadius: 10,
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'Programar atención',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
