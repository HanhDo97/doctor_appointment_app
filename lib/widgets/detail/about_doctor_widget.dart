import 'package:doctor_appointment/config/const.dart';
import 'package:flutter/material.dart';


class AboutDoctorWidget extends StatelessWidget {
  const AboutDoctorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 65,
          backgroundImage: AssetImage('assets/images/doctor_2.jpg'),
        ),
        Const.spaceMedium,
        Text(
          'Doctor Name One',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Const.spaceSmall,
        SizedBox(
          width: (Const.mediaWidth?.toDouble() ?? double.infinity) * 0.75,
          child: Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
        Const.spaceSmall,
        SizedBox(
          width: (Const.mediaWidth?.toDouble() ?? double.infinity) * 0.75,
          child: Text(
            'The name of Hospital',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
