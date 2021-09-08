import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/routes/routes.dart';

class DataMenu {
  IconData? icon;
  String? name;
  String? page;
  void Function()? fn;
  Color? color;
  DataMenu({
    this.icon,
    this.name,
    this.page,
    this.fn,
    this.color,
  });
}

List<DataMenu> dataMenu = [
  DataMenu(
    icon: Icons.home_rounded,
    name: 'Inicio',
    page: NameRoutes.home,
    fn: () => Get.offNamed(NameRoutes.home),
    color: Colors.black38,
  ),
  DataMenu(
    icon: Icons.calendar_today_rounded,
    name: 'Calendario',
    page: NameRoutes.calendar,
    fn: () => Get.offNamed(NameRoutes.calendar),
    color: Colors.black38,
  ),
  DataMenu(
    icon: Icons.accessibility_new_rounded,
    name: 'Clientes',
    page: NameRoutes.clientes,
    fn: () => Get.offNamed(NameRoutes.clientes),
    color: Colors.black38,
  ),
  DataMenu(
    icon: Icons.shopping_cart_rounded,
    name: 'Ventas',
    page: NameRoutes.calendar,
    fn: () => Get.offNamed(NameRoutes.sales),
    color: Colors.black38,
  ),
  DataMenu(
    icon: Icons.bar_chart_rounded,
    name: 'Estadísticas',
    page: NameRoutes.stats,
    fn: () => Get.offNamed(NameRoutes.stats),
    color: Colors.black38,
  ),
  DataMenu(
    icon: Icons.book_rounded,
    name: 'Registro de atenciones',
    page: NameRoutes.attentions,
    fn: () => Get.offNamed(NameRoutes.attentions),
    color: Colors.black38,
  ),
  DataMenu(
    icon: Icons.local_offer_rounded,
    name: 'Promociones',
    page: NameRoutes.offers,
    fn: () => Get.offNamed(NameRoutes.offers),
    color: Colors.black38,
  ),
  DataMenu(
    icon: Icons.home_work_rounded,
    name: 'Establecimientos',
    page: NameRoutes.establishments,
    fn: () => Get.offNamed(NameRoutes.establishments),
    color: Colors.black38,
  ),
  DataMenu(
    icon: Icons.chat_rounded,
    name: 'Chats',
    page: NameRoutes.chats,
    fn: () => Get.offNamed(NameRoutes.chats),
    color: Colors.black38,
  ),
];
