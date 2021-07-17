import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/home/domain/home_controller.dart';
import 'acttionBooking/por_confirmar.dart';
import 'atender/atender.dart';

class HomePageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (_) {
        return _.carga
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : DefaultTabController(
                length: 2,
                initialIndex: _.unconfirmed.isNotEmpty ? 1 : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TabBar(
                      indicatorColor: colorMain,
                      labelColor: colorMain,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      unselectedLabelColor: Colors.black54,
                      unselectedLabelStyle:
                          TextStyle(fontWeight: FontWeight.normal),
                      tabs: [
                        Tab(text: 'Atender'),
                        Tab(text: 'Confirmar'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          AtenderView(),
                          ConfirmarView(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
