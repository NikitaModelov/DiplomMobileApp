import 'package:flutter_application/data/model/graduate_card.dart';
import 'package:flutter_application/data/model/graduate_info.dart';
import 'package:flutter_application/data/service/students_service.dart';
import 'package:flutter_application/utills/hive/hive_boxes.dart';
import 'package:flutter_application/utills/token_key.dart';
import 'package:hive/hive.dart';

class GraduatesRepository {

  Future<GraduateInfo> getGraduateInfo(int id) async {
    return fetchGraduateById(id);
  }

  Future<List<GraduateCard>> getGraduates(String year, String faculty) async {
    var token = Hive.box(HiveBoxes.CONFIGURATION).get(TokenKey.ACCESS_TOKEN);
    return fetchGraduates(year, token);
  }
}
