import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:vet_app/design/styles/styles.dart';

// ignore: constant_identifier_names
enum TypeSnackBarName { INFO, SUCCESS, ERROR }

void snackBarMessage({
  required String message,
  TypeSnackBarName type = TypeSnackBarName.INFO,
  int seconds = 3,
}) {
  switch (type) {
    case TypeSnackBarName.INFO:
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          duration: Duration(seconds: seconds),
          content: CustomSnackBar.info(
            backgroundColor: colorBlue,
            message: message,
          ),
        ),
      );
      break;
    case TypeSnackBarName.SUCCESS:
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          duration: Duration(seconds: seconds),
          content: CustomSnackBar.success(
            backgroundColor: colorGreen,
            message: message,
          ),
        ),
      );
      break;
    case TypeSnackBarName.ERROR:
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          duration: Duration(seconds: seconds),
          content: CustomSnackBar.error(
            backgroundColor: colorRed,
            message: message,
          ),
        ),
      );
      break;
    default:
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          duration: Duration(seconds: seconds),
          content: CustomSnackBar.info(
            backgroundColor: colorBlue,
            message: message,
          ),
        ),
      );
      break;
  }
}
