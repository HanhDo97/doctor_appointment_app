import 'package:flutter/material.dart';

class HomeUserWidget extends StatelessWidget {
  const HomeUserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Hạnh Bụng Bự',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/profile1.jpg'),
          ),
        )
      ],
    );
  }
}
