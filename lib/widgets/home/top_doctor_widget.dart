import 'package:doctor_appointment/config/const.dart';
import 'package:flutter/material.dart';

class TopDoctorWidget extends StatelessWidget {
  const TopDoctorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Const.init(context);
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        height: 150,
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: Const.screenWidth * 0.33,
                child: Image.asset(
                  'assets/images/doctor_2.jpg',
                ),
              ),
              const Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Doctor One Name',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Dental',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.star_border,
                          size: 16,
                          color: Colors.yellow,
                        ),
                        Spacer(flex: 1),
                        Text('4.5'),
                        Spacer(flex: 1),
                        Text('Reviews'),
                        Spacer(flex: 1),
                        Text('20'),
                        Spacer(flex: 7),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        print('something');
      },
    );
  }
}
