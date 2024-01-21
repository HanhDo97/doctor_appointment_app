import 'dart:convert';
import 'dart:io';
import 'package:doctor_appointment/core/https/http_service.dart';
import 'package:doctor_appointment/core/responses/error_response.dart';
import 'package:doctor_appointment/core/responses/token_success_response.dart';
import 'package:doctor_appointment/core/widgets/loading/easy_loading_custom.dart';
import 'package:doctor_appointment/core/widgets/messages/dialog_show_error.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  HttpService httpService = HttpService();

  Future<dynamic> login(String email, String password, context) async {
    var data = {
      'email': email,
      'password': password,
    };
    EasyLoadingCustom.show(message: 'Loading...');
    httpService.post('/get_token', data).then((response) {
      EasyLoadingCustom.dismiss();
      if (response.statusCode == HttpStatus.ok) {
        _handleResponseSuccess(response, context);
      } else {
        _handleError(response, context);
      }
    });
  }

  Future<bool> checkTokenValid() async {
    var response = await httpService.get('/check_token_valid');
    if (response.statusCode == HttpStatus.ok) {
      return true;
    }
    return false;
  }

  _handleResponseSuccess(response, context) {
    var responseDecoded =
        TokenSuccessResponse.fromJson(jsonDecode(response.body));

    // set token
    final prefs = SharedPreferences.getInstance();
    prefs.then((value) {
      value.setString('token', responseDecoded.token);
    });

    // redeirect to main
    Navigator.pushNamed(context, 'main');
  }

  _handleError(response, context) {
    var responseDecoded = ErrorResponse.fromJson(jsonDecode(response.body));
    DialogShowError.show(context, responseDecoded.message);
  }
}
