import 'package:flutter/material.dart';
import 'package:vet_app/routes/routes.dart';

List<dynamic> dataMenu = [
  {
    'icon': Icons.home_rounded,
    'name': 'Inicio',
    'page': NameRoutes.home,
  },
  {
    'icon': Icons.calendar_today_rounded,
    'name': 'Calendario',
    'page': NameRoutes.calendar,
  },
  {
    'icon': Icons.book_rounded,
    'name': 'Registro de atenciones',
    'page': NameRoutes.attentions,
  },
  {
    'icon': Icons.bar_chart_rounded,
    'name': 'Estadísticas',
    'page': NameRoutes.stats,
  },
  {
    'icon': Icons.local_offer_rounded,
    'name': 'Promociones',
    'page': NameRoutes.offers,
  },
  {
    'icon': Icons.home_work_rounded,
    'name': 'Establecimientos',
    'page': NameRoutes.establishments,
  },
  {
    'icon': Icons.people_rounded,
    'name': 'Administradores',
    'page': NameRoutes.workers,
  },
  {
    'icon': Icons.chat_rounded,
    'name': 'Chats',
    'page': NameRoutes.chats,
  },
];
