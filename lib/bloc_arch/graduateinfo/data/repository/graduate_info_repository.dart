import 'package:graduate_stu/bloc_arch/graduateinfo/data/api/graduate_info_api_service.dart';
import 'package:graduate_stu/data/model/graduate_info.dart';
import 'package:graduate_stu/utills/hive/hive_boxes.dart';
import 'package:graduate_stu/utills/token_key.dart';
import 'package:hive/hive.dart';

class GraduateInfoRepository {
  static Future<GraduateInfo> getGraduateInfo(String id) async {
    var box = await Hive.openBox(HiveBoxes.CONFIGURATION);
    var token = box.get(TokenKey.ACCESS_TOKEN);

    return GraduateInfoApiService.fetchGraduateById(id, token);
  }
}
