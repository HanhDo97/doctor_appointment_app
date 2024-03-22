import 'package:doctor_appointment/config/const.dart';
import 'package:doctor_appointment/config/http_config.dart';
import 'package:flutter/material.dart';

class AboutDoctorWidget extends StatefulWidget {
  final String? doctorName;
  final String? doctorAbout;
  final String? doctorImage;

  const AboutDoctorWidget(
      {super.key,
      required this.doctorName,
      required this.doctorAbout,
      required this.doctorImage});

  @override
  State<AboutDoctorWidget> createState() => _AboutDoctorWidgetState();
}

class _AboutDoctorWidgetState extends State<AboutDoctorWidget> {
  @override
  Widget build(BuildContext context) {
    final image =
        widget.doctorImage ?? '${HttpConfig.serverUrl}/images/NoneImage.jfif';
    return Column(
      children: [
        CircleAvatar(
          radius: 65,
          backgroundImage: NetworkImage(image),
        ),
        Const.spaceMedium,
        Text(
          widget.doctorName ?? '',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Const.spaceSmall,
        SizedBox(
          width: (Const.mediaWidth?.toDouble() ?? double.infinity) * 0.75,
          child: Text(
            widget.doctorAbout ?? '',
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
