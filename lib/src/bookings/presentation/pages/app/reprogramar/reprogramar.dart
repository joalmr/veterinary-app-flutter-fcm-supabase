import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/components/forms/dateForm.dart';
import 'package:vet_app/components/forms/timeForm.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/bookings/domain/reprogramar/reprogramarController.dart';

class ReprogramarItem extends StatelessWidget {
  final String bookingId;
  final String petImg;
  final String petName;
  final String petBreed;
  final String date;
  final String time;
  final String userName;
  final String userPhone;
  final Color color;
  final String status;

  const ReprogramarItem({
    Key key,
    this.bookingId,
    this.petImg,
    this.petName,
    this.petBreed,
    this.date,
    this.time,
    this.userName,
    this.userPhone,
    this.color,
    this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ReprogramarController>(
      init: ReprogramarController(),
      builder: (_) {
        return Form(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Reprogramar'),
            ),
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 88.0,
                            width: 88.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: CachedNetworkImage(
                                  imageUrl: petImg,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    color: Colors.grey.shade200,
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator(),
                                  ),
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
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                petBreed,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '$date $time',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                                userName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                userPhone,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Text('Fecha'),
                      SizedBox(height: 5),
                      dateForm(onChanged: (val) => _.fecha.value = val),
                      SizedBox(height: 10),
                      Text('Hora'),
                      SizedBox(height: 5),
                      timeForm(onChanged: (val) => _.hora.value = val),
                      SizedBox(height: 30),
                      Center(
                        child: btnSecondary(
                          text: 'Reprogramar',
                          color: Colors.grey[600],
                          onPressed: () => _.reprogramar(bookingId),
                        ),
                      ),
                      _.errorDateTime.value
                          ? FadeIn(
                              child: Container(
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(5),
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: colorRed,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _.msgfecha.value,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        _.msghora.value,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(height: 0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
