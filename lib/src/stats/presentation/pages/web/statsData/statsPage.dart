import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/stats/domain/statsController.dart';
import 'package:vet_app/src/stats/presentation/pages/web/components/statContent.dart';
import 'package:vet_app/src/stats/presentation/widgets/chart/chartServicios.dart';
import 'package:vet_app/src/stats/presentation/widgets/chart/chartUsuarios.dart';
import 'package:vet_app/src/stats/presentation/widgets/chart/chartVentaMensual.dart';
import 'package:vet_app/src/stats/presentation/widgets/chart/chartVentasDia.dart';

import 'filterStas.dart';

class StatsData extends StatefulWidget {
  const StatsData({Key key}) : super(key: key);

  @override
  _StatsDataState createState() => _StatsDataState();
}

// final data = [55.0, 90.0, 50.0, 40.0, 35.0, 55.0, 70.0, 100.0];

class _StatsDataState extends State<StatsData> {
  bool filter = false;

  @override
  Widget build(BuildContext context) {
    return GetX<StatsController>(
      builder: (_) {
        return Container(
          child: 
          _.cargaBase.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            :
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30.0, top: 25.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Estadísticas',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 50),
                        child: btnAltern(
                          text: 'Filtros',
                          onPressed: () {
                            setState(() {
                              filter = !filter;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                filter ? FilterStat() : SizedBox(height: 0),
                Container(
                  margin: EdgeInsets.only(left: 32.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        alignment: WrapAlignment.start,
                        children: [
                          StatContent(
                            icon: Icons.star_rounded,
                            text: 'Estrellas',
                            value: _.statBase.value.stars,
                            color: colorGreen, //Colors.amber[300],
                          ),
                          StatContent(
                            icon: Icons.emoji_people_rounded,
                            text: 'Votantes',
                            value: _.statBase.value.votes.toString(),
                            color: colorGreen, //Colors.blue[300],
                          ),
                          StatContent(
                            icon: Icons.pets_rounded,
                            text: 'Perros',
                            value: _.statBase.value.dogs.toString(),
                            color: colorGreen, //Colors.brown[300],
                          ),
                          StatContent(
                            icon: Icons.pets_rounded,
                            text: 'Gatos',
                            value: _.statBase.value.cats.toString(),
                            color: colorGreen, //Color(0xFFcc9867),
                          ),
                          StatContent(
                            icon: Icons.desktop_access_disabled_rounded,
                            text: 'No atendidas',
                            value: '${_.statBase.value.nonAttendedPercentage}',
                            color: colorRed,
                          ),
                        ],
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Container(
                            height: 250,
                            width: 400,
                            margin: EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 10,
                            ),
                            child: ChartServicios(), //ChartService(),
                          ),
                          Container(
                            height: 250,
                            width: 400,
                            margin: EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 10,
                            ),
                            child: ChartVentasDia(),
                          ),
                          Container(
                            height: 250,
                            width: 400,
                            margin: EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 10,
                            ),
                            child: ChartVentaMensual(),
                          ),
                          Container(
                            height: 250,
                            width: 400,
                            margin: EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 10,
                            ),
                            child: ChartUsers(),
                          ),
                          // Container(
                          //   height: 250,
                          //   width: 400,
                          //   margin: EdgeInsets.all(5.0),
                          //   child: ChartLineArea(data: data),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    
  }
}
