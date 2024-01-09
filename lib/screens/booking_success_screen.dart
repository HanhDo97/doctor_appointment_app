import 'package:doctor_appointment/config/const.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BookingSuccess extends StatelessWidget {
  const BookingSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Lottie.asset('assets/success.json'),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text('Successfully Booked', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
            ),
            Spacer(),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            child: Container(
              width: Const.mediaWidth,
              child: TextButton(
                onPressed: (){
                  Navigator.of(context).pushNamed('main');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Const.primaryColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ))
                ),
                child: Text('Back to Home page', style: TextStyle(color: Colors.white),),
              ),
            ),)
          ],
        ),
      ),
    );
  }
}