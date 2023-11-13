import 'package:flutter/material.dart';

class HomeDoctorWidget extends StatelessWidget {
  const HomeDoctorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/doctor_1.jpg'),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name Of Doctor1",
              style: TextStyle(color: Colors.white),
            ),
            Text("Dental"),
          ],
        )
      ],
    );
  }
}
