import 'package:doctor_appointment/config/const.dart';
import 'package:doctor_appointment/config/lang.dart';
import 'package:doctor_appointment/widgets/button_widget.dart';
import 'package:doctor_appointment/widgets/login_form_widget.dart';
import 'package:doctor_appointment/widgets/social_button_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Const.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                Lang.enText['welcome']!,
                style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
              Const.spaceSmall,
              Text(
                Lang.enText['signInText']!,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
              Const.spaceSmall,
              const LoginFormWidget(),
              Const.spaceSmall,
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    Lang.enText['forgot-password']!,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                ),
              ),
              Const.spaceSmall,
              ButtonWidget(
                width: double.infinity,
                title: Lang.enText['signInText'] ?? "Sign In",
                disable: false,
                onPressed: () {
                  Navigator.of(context).pushNamed('main');
                },
              ),
              Const.spaceBig,
              Center(
                child: Text(
                  Lang.enText['socialLogin']!,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500,
                      decoration: TextDecoration.none),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SocialButtonWidget(
                      title: 'google',
                    ),
                    SocialButtonWidget(
                      title: 'facebook',
                    )
                  ],
                ),
              ),
              Const.spaceSmall,
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Lang.enText['signUpText']!,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                          decoration: TextDecoration.none),
                    ),
                    Text(
                      "Sign up",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration.none),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
