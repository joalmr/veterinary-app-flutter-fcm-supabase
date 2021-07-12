import 'package:flutter/material.dart';
import 'package:vet_app/routes/routes.dart';

List<dynamic> dataMenu = [
  {
    'icon': Icons.home_rounded,
    'name': 'Inicio',
    'page': NameRoutes.home,
  },//0
  {
    'icon': Icons.calendar_today_rounded,
    'name': 'Calendario',
    'page': NameRoutes.calendar,
  },//1
  {
    'icon': Icons.book_rounded,
    'name': 'Registro de atenciones',
    'page': NameRoutes.attentions,
  },//2
  {
    'icon': Icons.bar_chart_rounded,
    'name': 'Estadísticas',
    'page': NameRoutes.stats,
  },//3
  {
    'icon': Icons.local_offer_rounded,
    'name': 'Promociones',
    'page': NameRoutes.offers,
  },//4
  {
    'icon': Icons.home_work_rounded,
    'name': 'Establecimientos',
    'page': NameRoutes.establishments,
  },//5
  // {
  //   'icon': Icons.people_rounded,
  //   'name': 'Administradores',
  //   'page': NameRoutes.workers,
  // },//6
  {
    'icon': Icons.chat_rounded,
    'name': 'Chats',
    'page': NameRoutes.chats,
  },//7
  {
    'icon': Icons.accessibility_new_rounded,
    'name': 'Clientes',
    'page': NameRoutes.clientes,
  },//8
];
