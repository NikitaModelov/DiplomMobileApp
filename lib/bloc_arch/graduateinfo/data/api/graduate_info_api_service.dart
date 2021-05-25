import 'dart:convert';

import 'package:flutter_application/data/model/graduate_info.dart';
import 'package:flutter_application/data/service/students_service.dart';
import 'package:http/http.dart' as http;

class GraduateInfoApiService {
  static Future<GraduateInfo> fetchGraduateById(String id, String token) async {
    var url = Uri.https(NetworkData.BASE_URL, 'api/graduate_student/$id');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    }).timeout(Duration(seconds: 10));

    if (response.statusCode == 200) {
      return GraduateInfo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load student');
    }
  }
}
