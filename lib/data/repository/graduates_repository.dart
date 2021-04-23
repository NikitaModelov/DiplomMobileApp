import 'package:flutter_application/data/model/graduate_card.dart';
import 'package:flutter_application/data/model/graduate_info.dart';
import 'package:flutter_application/data/service/students_service.dart';

class GraduatesRepository {

  Future<GraduateInfo> getGraduateInfo(int id) async {
    return fetchGraduateById(id);
  }

  Future<List<GraduateCard>> getGraduates(String year, String faculty) async {
    return fetchGraduates(year, faculty);
  }
}
