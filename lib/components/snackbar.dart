import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

class TypeSnackBarName {
  // ignore: constant_identifier_names
  static const INFO = 'info';
  // ignore: constant_identifier_names
  static const SUCCESS = 'success';
  // ignore: constant_identifier_names
  static const ERROR = 'error';
}

void snackBarMessage({
  required String message,
  String type = TypeSnackBarName.INFO,
  int seconds = 3,
}) {
  switch (type) {
    case 'info':
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          duration: Duration(seconds: seconds),
          content: CustomSnackBar.info(
            message: message,
          ),
        ),
      );
      break;
    case 'success':
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          duration: Duration(seconds: seconds),
          content: CustomSnackBar.success(
            message: message,
          ),
        ),
      );
      break;
    case 'error':
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          duration: Duration(seconds: seconds),
          content: CustomSnackBar.error(
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
            message: message,
          ),
        ),
      );
      break;
  }
}
