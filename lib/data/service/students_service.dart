import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application/data/model/graduate_info.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application/data/model/graduate_card.dart';

class NetworkData {
  static const String BASE_URL = "diplomstu.herokuapp.com";
}

Future<List<GraduateCard>> fetchGraduates(String year, String token) async {
  var url = Uri.https(NetworkData.BASE_URL, '/api/graduate_student', {'year' : year});
  debugPrint("Request $url");
  final response =
      await http.get(url, headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      });

  if (response.statusCode == 200) {
    debugPrint("Request: <- ${response.statusCode} body: ${response.body}");
    List<dynamic> data = jsonDecode(response.body);

    return data.map((data) => GraduateCard.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load students');
  }
}

Future<GraduateInfo> fetchGraduateById(int id) async {
  var url = Uri.http(NetworkData.BASE_URL, 'graduate_student/$id');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return GraduateInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load student');
  }
}
