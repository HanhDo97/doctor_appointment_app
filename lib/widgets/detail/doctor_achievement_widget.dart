  import 'package:doctor_appointment/config/const.dart';
import 'package:flutter/material.dart';
  
class DoctorAchievementWidget extends StatelessWidget {
  const DoctorAchievementWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DoctorInfoCartWidget(
          label: 'Patient',
          value: '100',
        ),
        DoctorInfoCartWidget(
          label: 'Experiences',
          value: '3 years',
        ),
        DoctorInfoCartWidget(
          label: 'Rating',
          value: '4.6',
        ),
      ],
    );
  }
}

class DoctorInfoCartWidget extends StatelessWidget {
  final String label;
  final String value;
  const DoctorInfoCartWidget({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (Const.mediaWidth?.toDouble() ?? double.infinity) * 0.3,
      height: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Const.primaryColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
