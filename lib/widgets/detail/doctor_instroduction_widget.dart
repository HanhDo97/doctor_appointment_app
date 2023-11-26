import 'package:flutter/material.dart';

class DoctorIntroductionWidget extends StatelessWidget {
  const DoctorIntroductionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Doctor',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged',
            style: TextStyle(color: Colors.grey),
            softWrap: true,
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
