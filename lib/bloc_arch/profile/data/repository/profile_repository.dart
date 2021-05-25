import 'package:flutter_application/bloc_arch/profile/data/api/profile_api_service.dart';
import 'package:flutter_application/bloc_arch/profile/data/model/profile_model.dart';
import 'package:flutter_application/utills/hive/hive_boxes.dart';
import 'package:flutter_application/utills/token_key.dart';
import 'package:hive/hive.dart';

class ProfileRepository {

  static Future<Profile> getProfile() async {
    var box = await Hive.openBox(HiveBoxes.CONFIGURATION);
    var token = box.get(TokenKey.ACCESS_TOKEN);

    var response = await ProfileApiService.fetchProfile(token);
    return response.result;
  }
}