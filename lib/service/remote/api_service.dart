import 'dart:io';

import 'package:clean_architecture/core/constants/base_url.dart';
import 'package:clean_architecture/model/users_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  static Future getUsers() async {
    try {
      Response response = await Dio().get(BaseUrl.apiUrl);

      if (response.statusCode == HttpStatus.ok) {
        var responseData =
            (response.data as List).map((e) => UsersModel.fromJson(e)).toList();
        return responseData;
      }
    } catch (e) {
      return "No internet";
    }
  }
}
