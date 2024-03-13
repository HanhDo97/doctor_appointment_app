import 'dart:convert';

import 'package:doctor_appointment/core/exceptions/unauthenticated_exception.dart';
import 'package:doctor_appointment/core/https/http_service.dart';
import 'package:doctor_appointment/core/responses/success_response.dart';

class DataService {
  HttpService httpService = HttpService();

  Future<dynamic> getCategories() async {
    return await httpService.get('/list_type/categories').then((response) {
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        return SuccessResponse.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        throw UnauthenticatedException('Hết phiên đăng nhập !!!');
      }
      throw Exception('Failed to load user information');
    });
  }
}
