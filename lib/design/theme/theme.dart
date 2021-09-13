import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';

ThemeData temaClaro = ThemeData(
  // fontFamily: GoogleFonts.lato().fontFamily,
  scaffoldBackgroundColor: Colors.grey[100],
  primarySwatch: colorMain,
  primaryColor: colorMain,
  // accentColor: colorMain,
  // buttonColor: colorMain,
  brightness: Brightness.light,
  iconTheme: const IconThemeData(color: Colors.black38),
  tooltipTheme: const TooltipThemeData(
    padding: EdgeInsets.all(5),
    verticalOffset: 10,
    textStyle: TextStyle(
      fontSize: 10,
      color: Colors.white,
    ),
  ),
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w300,
      color: Colors.black38,
    ),
    centerTitle: false,
    iconTheme: IconThemeData(color: Colors.black38),
    actionsIconTheme: IconThemeData(color: Colors.black38),
    elevation: 0,
    color: Colors.transparent,
  ),
  dialogTheme: DialogTheme(shape: shape10),
  cardTheme: CardTheme(
    shape: shape10,
    shadowColor: Colors.black.withOpacity(0.3),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[200],
    contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
    hintStyle: const TextStyle(fontSize: 14.0),
    labelStyle: const TextStyle(fontSize: 16.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
        style: BorderStyle.none,
        width: 0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(color: colorMain),
    ),
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(color: Colors.black54),
    headline2: TextStyle(color: Colors.black54),
    headline3: TextStyle(color: Colors.black54),
    headline4: TextStyle(color: Colors.black54),
    headline5: TextStyle(color: Colors.black54, fontSize: 26.0),
    headline6: TextStyle(color: Colors.black54, fontSize: 20.0),
    subtitle1: TextStyle(color: Colors.black54, fontSize: 16.0),
    subtitle2: TextStyle(color: Colors.black54, fontSize: 14.0),
    bodyText1: TextStyle(color: Colors.black54, fontSize: 14.0),
    bodyText2: TextStyle(color: Colors.black54, fontSize: 12.0),
  ),
);
