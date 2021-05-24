import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application/data/service/students_service.dart';

class TokenPair {
  final String token;
  final String refreshToken;

  TokenPair({this.token, this.refreshToken});

  factory TokenPair.fromJson(Map<String, dynamic> json) {
    return TokenPair(token: json['accessToken'], refreshToken: json['refreshToken']);
  }
}

class LoginInfo {
  final String email;
  final String password;

  LoginInfo({@required this.email,@required this.password});
}

class Result<T> {
  final int statusCode;
  final T result;

  Result({@required this.statusCode, @required this.result});
}

class SignInApiService {
  static Future<Result<TokenPair>> signIn(LoginInfo loginInfo) async {

    try {
      var url = Uri.https(NetworkData.BASE_URL, '/api/login');

      final response = await http.post(
        url,
        body: jsonEncode({
          'email': '${loginInfo.email}',
          'password': '${loginInfo.password}'
        }),
        headers: {
          'Content-Type': 'application/json'
        }
      );
      if (response.statusCode == 202) {
        debugPrint("${response.body}");
        return Result(
          statusCode: response.statusCode,
          result: TokenPair.fromJson(jsonDecode(response.body)),
        );
      } else {
        debugPrint("${response.statusCode}");
        return Result(
            statusCode: response.statusCode,
            result: null);
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  static Future<int> validate(String token) async {
    try {
      var url = Uri.https(NetworkData.BASE_URL, '/api/validate');
      final response = await http.get(
          url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          }
      );
      debugPrint("validate: ${token}");
      debugPrint("validate: ${response.statusCode}");
      return response.statusCode;

    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  static Future<Result<TokenPair>> refreshToken(String refreshToken) async {
    debugPrint("refreshToken: $refreshToken");
    try {
      var url = Uri.https(NetworkData.BASE_URL, '/api/refresh');
      final response = await http.post(
          url,
          body: jsonEncode({
            'refreshToken': '$refreshToken',
          }),
          headers: {
            'Content-Type': 'application/json',
          }
      );

      if (response.statusCode == 200) {
        debugPrint("${response.body}");
        return Result(
          statusCode: response.statusCode,
          result: TokenPair.fromJson(jsonDecode(response.body)),
        );
      } else {
        debugPrint("refreshToken: ${response.statusCode}");
        return Result(
            statusCode: response.statusCode,
            result: null);
      }

    } catch (e) {
      debugPrint("Error: $e");
    }
  }
}
