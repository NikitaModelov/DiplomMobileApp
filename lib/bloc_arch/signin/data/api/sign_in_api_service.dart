import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application/data/service/students_service.dart';

class TokenPair {
  final String token;
  final String refreshToken;

  TokenPair({this.token, this.refreshToken});

  factory TokenPair.fromJson(Map<String, dynamic> json) {
    return TokenPair(token: json['token'], refreshToken: json['refreshToken']);
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
    var url = Uri.http(NetworkData.BASE_URL, 'login');
    final response = await http.post(
      url,
      body: {
        'email': '${loginInfo.email}',
        'password': '${loginInfo.password}'
      },
    );
    if (response.statusCode == 200) {
      return Result(
        statusCode: response.statusCode,
        result: TokenPair.fromJson(jsonDecode(response.body)),
      );
    } else {
      return Result(
        statusCode: response.statusCode,
        result: null);
    }
  }
}
