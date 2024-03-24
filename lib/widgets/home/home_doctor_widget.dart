import 'package:flutter/material.dart';

class HomeDoctorWidget extends StatelessWidget {
  final String doctorName;
  final String doctorImage;
  final String doctorCateName;
  const HomeDoctorWidget({
    super.key,
    required this.doctorName,
    required this.doctorImage,
    required this.doctorCateName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(doctorImage),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctorName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(doctorCateName),
          ],
        )
      ],
    );
  }
}
