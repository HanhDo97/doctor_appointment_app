import 'package:doctor_appointment/config/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class EasyLoadingCustom {
  static void show({required String message}) {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.black12
      ..indicatorColor = Colors.black
      ..backgroundColor = Const.primaryColor
      ..textColor = Colors.black
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;

    EasyLoading.show(status: message);
  }

  static void dismiss() {
    EasyLoading.dismiss();
  }
}
