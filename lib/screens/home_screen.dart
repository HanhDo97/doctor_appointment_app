import 'dart:convert';

import 'package:doctor_appointment/config/const.dart';
import 'package:doctor_appointment/config/lang.dart';
import 'package:doctor_appointment/core/widgets/messages/dialog_show_error.dart';
import 'package:doctor_appointment/services/login_service.dart';
import 'package:doctor_appointment/widgets/home/appointment_widget.dart';
import 'package:doctor_appointment/widgets/home/home_category_widget.dart';
import 'package:doctor_appointment/widgets/home/home_user_widget.dart';
import 'package:doctor_appointment/widgets/home/top_doctor_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LoginService loginService = LoginService();

  @override
  void initState() {
    super.initState();
    // Check Token valid
    checkToken();
  }

  Future<void> checkToken() async {
    try {
      bool isValid = await loginService.checkTokenValid();

      if (!isValid) {
        Navigator.of(context).pushNamed('/');
        DialogShowError.show(context, 'Hết phiên đăng nhập !!!');
      }
    } catch (e) {
      print('Check Token error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Const.init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: ListView(
          children: [
            HomeUserWidget(),
            Const.spaceMedium,
            Text(
              Lang.enText['categoryText'] ?? 'Category',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Const.spaceSmall,
            HomeCategoryWidget(),
            Const.spaceSmall,
            Text(
              Lang.enText['topDoctors'] ?? 'Top Doctors',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Const.spaceSmall,
            TopDoctorWidget(),
            Const.spaceSmall,
            Text(
              Lang.enText['appointmentTodayText'] ?? 'Appointments today',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Const.spaceSmall,
            AppointmentWidget(),
          ],
        ),
      ),
    );
  }
}
