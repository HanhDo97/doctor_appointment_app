import 'package:doctor_appointment/config/const.dart';
import 'package:doctor_appointment/config/lang.dart';
import 'package:doctor_appointment/services/login_service.dart';
import 'package:doctor_appointment/widgets/button_widget.dart';
import 'package:doctor_appointment/widgets/login_form_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailcontroller = TextEditingController();
  final _passcontroller = TextEditingController();
  final _loginService = LoginService();

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
              LoginFormWidget(
                fromKey: _formKey,
                emailcontroller: _emailcontroller,
                passcontroller: _passcontroller,
              ),
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
                  var isFormValid = _formKey.currentState!.validate();
                  if (isFormValid) {
                    _loginService.login(
                        _emailcontroller.text, _passcontroller.text, context);
                  }
                  // Navigator.of(context).pushNamed('main');
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
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 5)),
                      child: SizedBox(
                        width: Const.screenWidth * 0.4,
                        height: 50,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Image(
                              image: AssetImage('assets/images/google.png'),
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              'Google',
                              style: TextStyle(color: Colors.black38),
                            )
                          ],
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 5)),
                      child: SizedBox(
                        width: Const.screenWidth * 0.4,
                        height: 50,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Image(
                              image: AssetImage('assets/images/facebook.png'),
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              'Facebook',
                              style: TextStyle(color: Colors.black38),
                            )
                          ],
                        ),
                      ),
                    ),
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
                    const Text(
                      "Sign up",
                      style: TextStyle(
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
