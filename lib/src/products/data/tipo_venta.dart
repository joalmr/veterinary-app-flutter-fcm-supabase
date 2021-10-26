import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

List itemListSales = [
  {
    'label': 'Alimento',
    'value': 1,
    'icon': Container(
      key: UniqueKey(),
      height: 20,
      width: 20,
      child: SvgPicture.asset(
        'assets/images/svg/alimento.svg',
      ),
    ),
  },
  {
    'label': 'Vestimenta',
    'value': 2,
    'icon': Container(
      key: UniqueKey(),
      height: 20,
      width: 20,
      child: SvgPicture.asset(
        'assets/images/svg/vestimenta.svg',
      ),
    ),
  },
  {
    'label': 'Juguete',
    'value': 3,
    'icon': Container(
      key: UniqueKey(),
      height: 20,
      width: 20,
      child: SvgPicture.asset(
        'assets/images/svg/juguete.svg',
      ),
    ),
  },
  {
    'label': 'Accesorio',
    'value': 4,
    'icon': Container(
      key: UniqueKey(),
      height: 20,
      width: 20,
      child: SvgPicture.asset(
        'assets/images/svg/accesorio.svg',
      ),
    ),
  },
  {
    'label': 'Cuidado e higiene',
    'value': 5,
    'icon': Container(
      key: UniqueKey(),
      height: 20,
      width: 20,
      child: SvgPicture.asset(
        'assets/images/svg/higiene.svg',
      ),
    ),
  },
  {
    'label': 'Fármaco',
    'value': 6,
    'icon': Container(
      key: UniqueKey(),
      height: 20,
      width: 20,
      child: SvgPicture.asset(
        'assets/images/svg/farmaco.svg',
      ),
    ),
  },
  {
    'label': 'Otro',
    'value': 7,
    'icon': Container(
      key: UniqueKey(),
      height: 20,
      width: 20,
      child: SvgPicture.asset(
        'assets/images/svg/otro.svg',
      ),
    ),
  },
];
