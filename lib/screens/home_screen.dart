import 'dart:convert';

import 'package:doctor_appointment/config/const.dart';
import 'package:doctor_appointment/config/lang.dart';
import 'package:doctor_appointment/widgets/home/appointment_widget.dart';
import 'package:doctor_appointment/widgets/home/home_category_widget.dart';
import 'package:doctor_appointment/widgets/home/home_user_widget.dart';
import 'package:doctor_appointment/widgets/home/top_doctor_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> medCat = [
    {
      "icon": const AssetImage('assets/icons/medical.png'),
      "category": "General",
    },
    {
      "icon": const AssetImage('assets/icons/heart-attack.png'),
      "category": "Cardiology",
    },
    {
      "icon": const AssetImage('assets/icons/lungs.png'),
      "category": "Respirations",
    },
    {
      "icon": const AssetImage('assets/icons/hand.png'),
      "category": "Dermatology",
    },
    {
      "icon": const AssetImage('assets/icons/pregnant.png'),
      "category": "Gynecology",
    },
    {
      "icon": const AssetImage('assets/icons/tooth.png'),
      "category": "Dental",
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Const.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15,
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ignore: prefer_const_constructors
                HomeUserWidget(),
                Const.spaceMedium,
                Text(
                  Lang.enText['categoryText'] ?? 'Category',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Const.spaceSmall,
                HomeCategoryWidget(medCat: medCat),
                Const.spaceSmall,
                Text(
                  Lang.enText['appointmentTodayText'] ?? 'Appointments today',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Const.spaceSmall,
                const AppointmentWidget(),
                Const.spaceSmall,
                Text(
                  Lang.enText['topDoctors'] ?? 'Top Doctors',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Const.spaceSmall,
                Column(
                  children: List.generate(10, (index) {
                    return const TopDoctorWidget();
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
