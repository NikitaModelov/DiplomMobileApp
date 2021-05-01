import 'package:flutter_application/bloc_arch/graduateinfo/data/api/graduate_info_api_service.dart';
import 'package:flutter_application/data/model/graduate_info.dart';

class GraduateInfoRepository {
  static Future<GraduateInfo> getGraduateInfo(int id) async {
    return GraduateInfoApiService.fetchGraduateById(id);
  }
}
