import 'package:doctor_appointment/config/const.dart';
import 'package:doctor_appointment/core/notifiers/user_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: Const.mediaWidth,
                child: TextButton(
                  onPressed: () {
                    final userModel =
                        Provider.of<UserChangeNotifier>(context, listen: false);
                    userModel.reset();

                    Navigator.of(context).pushNamed('/');
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Const.primaryColor),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                      alignment: Alignment.centerLeft),
                  child: Text(
                    'Sign out',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
