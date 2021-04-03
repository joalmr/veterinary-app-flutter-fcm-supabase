import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/app/menu.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/home/domain/homeController.dart';
import 'acttionBooking/confirmar.dart';
import 'atender/atender.dart';

class HomePageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (_) {
        return Scaffold(
          drawer: MenuDrawer(),
          appBar: AppBar(
            title: FadeIn(child: Text(_.v.nameVet)),
            centerTitle: false,
          ),
          body: _.v.carga
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : DefaultTabController(
                  length: 2,
                  initialIndex: _.v.reservas.length > 0 ? 1 : 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TabBar(
                        indicatorColor: colorMain,
                        labelColor: colorMain,
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        unselectedLabelColor: Colors.black54,
                        unselectedLabelStyle:
                            TextStyle(fontWeight: FontWeight.normal),
                        tabs: [
                          Tab(text: "Atender"),
                          Tab(text: "Confirmar"),
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
                ),
        );
      },
    );
  }
}
