import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application/data/model/graduate_card.dart';
import 'package:flutter_application/data/service/students_service.dart';
import 'package:http/http.dart' as http;

class GraduateListApiService {
  static Future<List<GraduateCard>> fetchGraduates(String year, String token) async {
    debugPrint("Init");
    var url =
        Uri.https(NetworkData.BASE_URL, 'api/graduate_student', {'year': year});
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    }).timeout(Duration(seconds: 10));

    if (response.statusCode == 200) {
      debugPrint("${response.body}");
      List<dynamic> data = jsonDecode(response.body);
      debugPrint("${data}");
      return data.map((data) => GraduateCard.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load students');
    }
  }
}
