import 'package:graduate_stu/bloc_arch/graduates/data/api/graduate_list_service.dart';
import 'package:graduate_stu/data/model/graduate_card.dart';
import 'package:graduate_stu/utills/hive/hive_boxes.dart';
import 'package:graduate_stu/utills/token_key.dart';
import 'package:hive/hive.dart';

class GraduateListRepository {
  static Future<List<GraduateCard>> getGraduates(String year, String group) async {
    var box = await Hive.openBox(HiveBoxes.CONFIGURATION);
    var token = box.get(TokenKey.ACCESS_TOKEN);

    return GraduateListApiService.fetchGraduates(year, group, token);
  }
}
