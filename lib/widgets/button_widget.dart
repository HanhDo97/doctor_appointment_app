import 'package:doctor_appointment/config/const.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final double width;
  final String title;
  final bool disable;
  final VoidCallback onPressed;

  const ButtonWidget(
      {super.key,
      required this.width,
      required this.title,
      required this.disable,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: disable ? null : onPressed,
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
