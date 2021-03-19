import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:vet_app/assets/images/images.dart';
import 'package:vet_app/design/styles/styles.dart';
import '../domain/vetController.dart';

class VetMain extends StatelessWidget {
  const VetMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VetController>(
      init: VetController(),
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 60,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Veterinaria Patita',
                                  style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 72,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  'Los mejores amigos de tu mascota',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w300,
                                    // fontStyle: FontStyle.italic,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      TextButton(
                                        child: Text(
                                          'Ver en mapa',
                                          style: TextStyle(
                                            color: Colors.pink,
                                            fontSize: 16,
                                          ),
                                        ),
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 20.0,
                                            horizontal: 35.0,
                                          ),
                                          alignment: Alignment.center,
                                          side: BorderSide(
                                            color: Colors.pink,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 25),
                                      TextButton(
                                        child: Text(
                                          'Reservar',
                                          style: TextStyle(
                                            color: Colors.pink,
                                            fontSize: 16,
                                          ),
                                        ),
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 20.0,
                                            horizontal: 35.0,
                                          ),
                                          alignment: Alignment.center,
                                          side: BorderSide(
                                            color: Colors.pink,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 40,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 13.0,
                                  spreadRadius: 0.0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image(
                                    height: double.maxFinite,
                                    width: double.maxFinite,
                                    image: AssetImage(imgVet),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.pink,
                          child: Padding(
                            padding: EdgeInsets.all(2.5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image(
                                height: double.maxFinite,
                                image: AssetImage(imgLogo),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60),
                Padding(
                  padding: EdgeInsets.only(left: 60),
                  child: Image(
                    height: 100,
                    image: AssetImage(imgTitleServicio),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 60),
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  child: Row(
                    children: [
                      Container(
                        width: (context.width - 60) / 2,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Wrap(
                              direction: Axis.horizontal,
                              children: [
                                for (var i = 0; i < 11; i++)
                                  Container(
                                    margin: EdgeInsets.all(7.5),
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 13.0,
                                          spreadRadius: 0.0,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.home_outlined,
                                        size: 52,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: (context.width - 60) / 2,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Image(
                            height: 400,
                            image: AssetImage(imgLandService),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60),
                Padding(
                  padding: EdgeInsets.only(left: 60),
                  child: Image(
                    height: 100,
                    image: AssetImage(imgTitlePromocion),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 60),
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 550,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 50,
                                top: 115,
                                child: Image(
                                  height: 450,
                                  image: AssetImage(imgLandBtn),
                                ),
                              ),
                              Positioned(
                                top: 100,
                                left: 150,
                                child: TextButton(
                                  child: Text(
                                    'Reservar',
                                    style: TextStyle(
                                      color: Colors.pink,
                                      fontSize: 20,
                                    ),
                                  ),
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 20.0,
                                      horizontal: 35.0,
                                    ),
                                    alignment: Alignment.center,
                                    side: BorderSide(
                                      color: Colors.pink,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: SingleChildScrollView(
                            padding: EdgeInsets.only(left: 20, top: 20),
                            child: Wrap(
                              children: [
                                for (var i = 0; i < 5; i++)
                                  Container(
                                      width: 200,
                                      height: 250,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 13.0,
                                            spreadRadius: 0.0,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                Icons.home_outlined,
                                                size: 36,
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    '50%',
                                                    style: TextStyle(
                                                      color: colorRed,
                                                      fontSize: 28,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                  Text(
                                                    'desc.',
                                                    style: TextStyle(
                                                      color: colorRed,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                              '''Bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla''')
                                        ],
                                      )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 200),
              ],
            ),
          ),
        );
      },
    );
  }
}
