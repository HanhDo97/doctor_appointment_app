import 'dart:convert';
import 'package:doctor_appointment/config/http_config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HttpService {
  Future<http.Response> get(String endPoint) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    var response = await http.get(
      Uri.parse(HttpConfig.baseUrl + endPoint),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    return response;
  }

  Future<http.Response> post(String endPoint, dynamic data) async {
    debugPrint(HttpConfig.baseUrl + endPoint);
    late http.Response response;
    try {
      response = await http.post(
        Uri.parse(HttpConfig.baseUrl + endPoint),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
        body: jsonEncode(data),
      );
    } catch (e) {
      return http.Response(e.toString(), 500); // Return a default response
    }

    return response;
  }
}
