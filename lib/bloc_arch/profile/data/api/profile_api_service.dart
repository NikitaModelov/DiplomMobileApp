import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application/bloc_arch/profile/data/model/profile_model.dart';
import 'package:flutter_application/bloc_arch/signin/data/api/sign_in_api_service.dart';
import 'package:flutter_application/data/service/students_service.dart';
import 'package:http/http.dart' as http;

class ProfileApiService {

  static Future<Result<Profile>> fetchProfile(String token) async {
    try {
      var url = Uri.https(NetworkData.BASE_URL, '/api/user');

      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        debugPrint("${response.body}");
        return Result(
          statusCode: response.statusCode,
          result: Profile.fromJson(jsonDecode(response.body)),
        );
      } else {
        debugPrint("${response.statusCode}");
        return Result(statusCode: response.statusCode, result: null);
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }
}