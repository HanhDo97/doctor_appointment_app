import 'package:doctor_appointment/config/const.dart';
import 'package:flutter/material.dart';

class LoginFormWidget extends StatefulWidget {
  final GlobalKey<FormState> fromKey;
  const LoginFormWidget({super.key, required this.fromKey});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  static final _emailController = TextEditingController();
  static final _passController = TextEditingController();
  bool _obsecurePass = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.fromKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _buildEmailFormField(),
          Const.spaceSmall,
          _buildPasswordFormField(),
        ],
      ),
    );
  }

  Widget _buildEmailFormField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      cursorColor: Const.primaryColor,
      validator: ((value) {
        if (value!.isEmpty) {
          return 'Please enter your email address';
        } else if (!value.contains('@')) {
          return 'Please enter a valid email address';
        } else {
          return null;
        }
      }),
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
    );
  }

  Widget _buildPasswordFormField() {
    return TextFormField(
      controller: _passController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obsecurePass,
      cursorColor: Const.primaryColor,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your password';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters';
        } else {
          return null;
        }
      },
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
            icon: Icon(_obsecurePass ? Icons.visibility_off : Icons.visibility),
          )),
    );
  }
}
