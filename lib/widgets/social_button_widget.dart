import 'package:doctor_appointment/config/const.dart';
import 'package:flutter/material.dart';

class SocialButtonWidget extends StatelessWidget {
  final String title;
  const SocialButtonWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.symmetric(vertical: 5)),
      child: SizedBox(
        width: Const.screenWidth * 0.4,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/$title.png'),
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
            Text(
              '$title'.toUpperCase(),
              style: TextStyle(color: Colors.black38),
            )
          ],
        ),
      ),
    );
  }
}
