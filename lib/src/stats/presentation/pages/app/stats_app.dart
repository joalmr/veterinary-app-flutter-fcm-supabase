import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/app/menu.dart';
import 'package:vet_app/design/styles/styles.dart';

import 'base/values_stats.dart';
import 'comentarios/feedback_view.dart';
import 'components/filter_stat_view.dart';
import 'widgets/percent/percent_servicios.dart';
import 'widgets/percent/percent_usuarios_mensual.dart';
import 'widgets/percent/percent_venta_mensual.dart';
import 'widgets/percent/percent_ventas_dia.dart';

class StatsPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title: const Text('Estadísticas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_rounded),
            onPressed: () => Get.to(const FilterStatView()),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const TabBar(
              isScrollable: true,
              indicatorColor: colorMain,
              labelColor: colorMain,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.black54,
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
              tabs: [
                Tab(text: 'General'),
                Tab(text: 'Comentarios'),
                Tab(text: 'Servicios atendidos'),
                Tab(text: 'Ventas por día'),
                Tab(text: 'Venta mensual'),
                Tab(text: 'Usuarios mensual'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  ValuesStats(),
                  FeedbackView(),
                  PercentServicios(),
                  PercentVentasDia(),
                  PercentVentaMensual(),
                  PercentUsuariosMensual(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
