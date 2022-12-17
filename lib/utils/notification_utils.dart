import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_api_provider/main.dart';

class NotifUtils {
  static void showSnackbar(String message, {Color? bgColor}) {
    notifKey.currentState?.showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: bgColor,
      behavior: SnackBarBehavior.floating,
    ));
  }
}
