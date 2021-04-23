import 'dart:convert';
import 'package:flutter_application/data/model/graduate_info.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application/data/model/graduate_card.dart';

class NetworkData {
  static const String BASE_URL = "10.0.2.2:8080";
}

Future<List<GraduateCard>> fetchGraduates(String year, String faculty) async {
  var url = Uri.http(NetworkData.BASE_URL, 'graduate_student/$year/$faculty');
  final response = await http.get(url);

  if (response.statusCode == 200) {
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
    return GraduateInfo.fromJson(response.headers);
  } else {
    throw Exception('Failed to load student');
  }
}

/*
await http.post("http://calikidsmap.com/test.php").then((response){

var ddd=jsonDecode(response.body);

Country_object_list = (ddd as List)
    .map((data) => new country.fromJson(data))
.toList();*/
