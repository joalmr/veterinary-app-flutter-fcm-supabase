import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/assets/images/images.dart';
import 'package:vet_app/assets/utils/diaSemana.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/establishments/domain/establishmentsController.dart';

import 'employeeShow.dart';
import 'priceShow.dart';
import 'scheduleShow.dart';

class ShowVetView extends StatelessWidget {
  const ShowVetView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<EstablishmentsController>(
      builder: (_) {
        final esTemp = _.v.establishment;
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: context.height * 0.245,
            automaticallyImplyLeading: false,
            flexibleSpace: Stack(
              children: <Widget>[
                Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      width: double.infinity,
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(imgVetFoto),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 5,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Get.back(),
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 5,
                  child: Container(
                    height: 25.0,
                    width: 25.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: IconButton(
                        splashRadius: 20,
                        iconSize: 18,
                        icon: Icon(
                          Icons.edit,
                        ),
                        onPressed: () {
                          print('slide');
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 7.5,
                  bottom: 9.5,
                  child: Stack(
                    children: [
                      Container(
                        height: 55.0,
                        width: 55.0,
                        decoration: BoxDecoration(
                          color: colorGray1,
                          borderRadius: BorderRadius.circular(100.0),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(esTemp.logo),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Container(
                          height: 25.0,
                          width: 25.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: IconButton(
                              splashRadius: 20,
                              iconSize: 18,
                              icon: Icon(
                                Icons.edit,
                              ),
                              onPressed: () {
                                print('logo');
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: _.v.cargaById
              ? Center(child: CircularProgressIndicator())
              : Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: ListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              minVerticalPadding: 0,
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      borderRadius: borderRadius,
                                      color: colorMain,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 1.5,
                                      horizontal: 5,
                                    ),
                                    child: Text(
                                      'Ej->Veterinaria',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 8,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Text(esTemp.name,
                                      maxLines: 2,
                                      style: Get.textTheme.subtitle1
                                          .apply(fontWeightDelta: 2)),
                                ],
                              ),
                              subtitle: Text('Ej-> direccion bla bla ',
                                  style: TextStyle(fontSize: 12)),
                              trailing: Stack(
                                children: <Widget>[
                                  Container(height: 56.0, width: 60.0),
                                  Container(
                                    height: 50.0,
                                    width: 50.0,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        color: colorYellow),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.star,
                                              color: Colors.white, size: 12.0),
                                          Text(
                                            esTemp.stars,
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0.0,
                                    right: 0.0,
                                    child: Container(
                                      height: 25.0,
                                      width: 25.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: Colors.white,
                                        // color: _.vet.typeId == 1 ? colorMain : colorBlue,
                                      ),
                                      child: Center(
                                        child: IconButton(
                                          splashRadius: 20,
                                          iconSize: 18,
                                          icon: Icon(Icons.edit),
                                          onPressed: () {
                                            print('datos basicos');
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
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
                                "Servicios",
                                style: Get.textTheme.subtitle2
                                    .apply(fontWeightDelta: 2),
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
                        Container(
                          child: SizedBox(
                            height: 60,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index) =>
                                  Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.5),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 5),
                                    Container(
                                      height: 32,
                                      width: 32,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Get.theme
                                            .backgroundColor, //Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              blurRadius: 3.0,
                                              spreadRadius: 2.0)
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.pets,
                                          size: 20,
                                          color: Get.textTheme.subtitle2.color,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Ej->Serv',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 8.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
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
                                style: Get.textTheme.subtitle2
                                    .apply(fontWeightDelta: 2),
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
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            esTemp.description,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        SizedBox(height: 10.0),
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
                                "Precios",
                                style: Get.textTheme.subtitle2
                                    .apply(fontWeightDelta: 2),
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
                        Wrap(
                          children: [
                            precio(
                              'Consulta',
                              esTemp.prices.consultation.from.toString(),
                            ),
                            precio(
                              'Grooming',
                              esTemp.prices.grooming.from.toString(),
                            ),
                            precio(
                              'Desparasitación',
                              esTemp.prices.deworming.from.toString(),
                            ),
                            precio(
                              'Vacunas',
                              esTemp.prices.vaccination.from.toString(),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
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
                                "Horarios",
                                style: Get.textTheme.subtitle2
                                    .apply(fontWeightDelta: 2),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              horario(
                                day: diaSemana[0],
                                daySwitch: esTemp.schedule.monday.daySwitch,
                                timeStart: esTemp.schedule.monday.timeStart,
                                timeEnd: esTemp.schedule.monday.timeEnd,
                              ),
                              horario(
                                day: diaSemana[1],
                                daySwitch: esTemp.schedule.tuesday.daySwitch,
                                timeStart: esTemp.schedule.tuesday.timeStart,
                                timeEnd: esTemp.schedule.tuesday.timeEnd,
                              ),
                              horario(
                                day: diaSemana[2],
                                daySwitch: esTemp.schedule.wednesday.daySwitch,
                                timeStart: esTemp.schedule.wednesday.timeStart,
                                timeEnd: esTemp.schedule.wednesday.timeEnd,
                              ),
                              horario(
                                day: diaSemana[3],
                                daySwitch: esTemp.schedule.thursday.daySwitch,
                                timeStart: esTemp.schedule.thursday.timeStart,
                                timeEnd: esTemp.schedule.thursday.timeEnd,
                              ),
                              horario(
                                day: diaSemana[4],
                                daySwitch: esTemp.schedule.friday.daySwitch,
                                timeStart: esTemp.schedule.friday.timeStart,
                                timeEnd: esTemp.schedule.friday.timeEnd,
                              ),
                              horario(
                                day: diaSemana[5],
                                daySwitch: esTemp.schedule.saturday.daySwitch,
                                timeStart: esTemp.schedule.saturday.timeStart,
                                timeEnd: esTemp.schedule.saturday.timeEnd,
                              ),
                              horario(
                                day: diaSemana[6],
                                daySwitch: esTemp.schedule.sunday.daySwitch,
                                timeStart: esTemp.schedule.sunday.timeStart,
                                timeEnd: esTemp.schedule.sunday.timeEnd,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
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
                                "Empleados",
                                style: Get.textTheme.subtitle2
                                    .apply(fontWeightDelta: 2),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: esTemp.employees
                                .map(
                                  (e) => employee(
                                    type: e.typeId,
                                    name: e.name,
                                    code: e.code,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
