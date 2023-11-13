import 'package:doctor_appointment/config/const.dart';
import 'package:flutter/material.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  static final _formKey = GlobalKey<FormState>();
  static final _emailController = TextEditingController();
  static final _passController = TextEditingController();
  bool _obsecurePass = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Const.primaryColor,
            decoration: InputDecoration(
              hintText: 'Email Address',
              labelText: 'Email',
              alignLabelWithHint: true,
              prefixIcon: const Icon(Icons.email_outlined),
              prefixIconColor: MaterialStateColor.resolveWith((states) =>
                  states.contains(MaterialState.focused)
                      ? Const.primaryColor
                      : Colors.black38),
            ),
          ),
          Const.spaceSmall,
          TextFormField(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: _obsecurePass,
            cursorColor: Const.primaryColor,
            decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                alignLabelWithHint: true,
                prefixIcon: const Icon(Icons.lock_outline),
                prefixIconColor: MaterialStateColor.resolveWith((states) =>
                    states.contains(MaterialState.focused)
                        ? Const.primaryColor
                        : Colors.black38),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obsecurePass = !_obsecurePass;
                    });
                  },
                  icon: Icon(
                      _obsecurePass ? Icons.visibility_off : Icons.visibility),
                )),
          )
        ],
      ),
    );
  }
}
