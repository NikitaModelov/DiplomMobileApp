import 'package:flutter_application/bloc_arch/graduates/data/api/graduate_list_service.dart';
import 'package:flutter_application/data/model/graduate_card.dart';
import 'package:flutter_application/utills/hive/hive_boxes.dart';
import 'package:flutter_application/utills/token_key.dart';
import 'package:hive/hive.dart';

class GraduateListRepository {
  static Future<List<GraduateCard>> getGraduates(String year) async {
    var box = await Hive.openBox(HiveBoxes.CONFIGURATION);
    var token = box.get(TokenKey.ACCESS_TOKEN);

    return GraduateListApiService.fetchGraduates(year, token);
  }
}
