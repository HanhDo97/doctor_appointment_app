import 'dart:ui';

import 'package:doctor_appointment/config/const.dart';
import 'package:doctor_appointment/widgets/detail/about_doctor_widget.dart';
import 'package:doctor_appointment/widgets/detail/detail_app_bar.dart';
import 'package:doctor_appointment/widgets/detail/doctor_achievement_widget.dart';
import 'package:doctor_appointment/widgets/detail/doctor_instroduction_widget.dart';
import 'package:flutter/material.dart';
import 'package:doctor_appointment/config/const.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var isFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailAppBar(
        isFav: isFav,
        onBack: () {
          Navigator.of(context).pop();
        },
        onFavoritePressed: () {
          setState(() {
            isFav = !isFav;
          });
        },
      ),
      body: Container(
        width: Const.mediaWidth,
        height: Const.mediaHeight,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AboutDoctorWidget(),
              Const.spaceMedium,
              DoctorAchievementWidget(),
              Const.spaceSmall,
              DoctorIntroductionWidget(),
              Const.spaceBig,
              Container(
                width: Const.mediaWidth,
                height: 50,
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Const.primaryColor),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)))),
                  onPressed: () {
                    Navigator.of(context).pushNamed('booking');
                  },
                  child: Text(
                    'Booking Appointment',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
