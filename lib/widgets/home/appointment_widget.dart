import 'package:doctor_appointment/config/const.dart';
import 'package:doctor_appointment/widgets/home/action_appointment_widget.dart';
import 'package:doctor_appointment/widgets/home/home_doctor_widget.dart';
import 'package:flutter/material.dart';

class AppointmentWidget extends StatelessWidget {
  const AppointmentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Const.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Material(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              HomeDoctorWidget(),
              Const.spaceSmall,
              ActionAppointmentWidget()
            ],
          ),
        ),
      ),
    );
  }
}
