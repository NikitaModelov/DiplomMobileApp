import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:graduate_stu/data/model/graduate_info.dart';
import 'package:graduate_stu/data/service/students_service.dart';
import 'package:http/http.dart' as http;

class GraduateInfoApiService {
  static Future<GraduateInfo> fetchGraduateById(String id, String token) async {
    var url = Uri.https(NetworkData.BASE_URL, 'api/graduate_student/$id');
    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        debugPrint("${response.body}");
        return GraduateInfo.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load student');
      }
    } catch (e) {
      debugPrint("ERROR API");
    }

  }
}
