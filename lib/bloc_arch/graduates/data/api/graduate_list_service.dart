import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application/data/model/graduate_card.dart';
import 'package:flutter_application/data/service/students_service.dart';
import 'package:http/http.dart' as http;

class GraduateListApiService {

  static Future<List<GraduateCard>> fetchGraduates(String year, String faculty) async {
    debugPrint("Init");
    var url = Uri.http(NetworkData.BASE_URL, 'graduate_student/$year/$faculty');
    final response = await http.get(url).timeout(Duration(seconds: 10));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      return data.map((data) => GraduateCard.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load students');
    }
  }
}
