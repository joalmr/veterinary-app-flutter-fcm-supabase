import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/config/variables_global.dart';
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
    fn: prefUser.hasMenu ? () => Get.offNamed(NameRoutes.home) : null,
    color: prefUser.hasMenu ? Colors.black38 : Colors.grey[200],
  ),
  DataMenu(
    icon: Icons.calendar_today_rounded,
    name: 'Calendario',
    page: NameRoutes.calendar,
    fn: prefUser.hasMenu ? () => Get.offNamed(NameRoutes.calendar) : null,
    color: prefUser.hasMenu ? Colors.black38 : Colors.grey[200],
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
    fn: prefUser.hasMenu ? () => Get.offNamed(NameRoutes.sales) : null,
    color: prefUser.hasMenu ? Colors.black38 : Colors.grey[200],
  ),
  DataMenu(
    icon: Icons.bar_chart_rounded,
    name: 'Estadísticas',
    page: NameRoutes.stats,
    fn: prefUser.hasMenu ? () => Get.offNamed(NameRoutes.stats) : null,
    color: prefUser.hasMenu ? Colors.black38 : Colors.grey[200],
  ),
  DataMenu(
    icon: Icons.book_rounded,
    name: 'Registro de atenciones',
    page: NameRoutes.attentions,
    fn: prefUser.hasMenu ? () => Get.offNamed(NameRoutes.attentions) : null,
    color: prefUser.hasMenu ? Colors.black38 : Colors.grey[200],
  ),
  DataMenu(
    icon: Icons.local_offer_rounded,
    name: 'Promociones',
    page: NameRoutes.offers,
    fn: prefUser.hasMenu ? () => Get.offNamed(NameRoutes.offers) : null,
    color: prefUser.hasMenu ? Colors.black38 : Colors.grey[200],
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
