import 'package:flutter_application/bloc_arch/graduates/data/api/graduate_list_service.dart';
import 'package:flutter_application/data/model/graduate_card.dart';

class GraduateListRepository {
  static Future<List<GraduateCard>> getGraduates(String year, String faculty) async {
    return GraduateListApiService.fetchGraduates(year, faculty);
  }
}
