import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'base/values_stats.dart';
import 'comentarios/feedback_view.dart';
import 'widgets/percent/percent_servicios.dart';
import 'widgets/percent/percent_venta_mensual.dart';
import 'widgets/percent/percent_ventas_dia.dart';

class StatsPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
              // Tab(text: 'Usuarios mensual'),
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
                // PercentUsuariosMensual(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
