import 'package:flutter/cupertino.dart';
import 'package:graduate_stu/bloc_arch/signin/data/api/sign_in_api_service.dart';
import 'package:graduate_stu/utills/hive/hive_boxes.dart';
import 'package:graduate_stu/utills/token_key.dart';
import 'package:hive/hive.dart';

class SignInRepository {
  static Future<int> signIn(LoginInfo loginInfo) async {
    var response = await SignInApiService.signIn(loginInfo);

    if (response.statusCode == 202) {
      var box = await Hive.openBox(HiveBoxes.CONFIGURATION);

      box.put(TokenKey.ACCESS_TOKEN, response.result.token);
      box.put(TokenKey.REFRESH_TOKEN, response.result.refreshToken);
    } else {
      debugPrint("fdsfdsf");
    }

    return response.statusCode;
  }

  static Future<int> volidateToken() async {
    var box = await Hive.openBox(HiveBoxes.CONFIGURATION);
    var token = box.get(TokenKey.ACCESS_TOKEN);

    if (await SignInApiService.validate(token) == 202) {
      box.close();
      return 202;
    } else {
      var response = await _refreshToken();

      if (response.statusCode == 200) {
        box.put(TokenKey.ACCESS_TOKEN, response.result.token);
        box.put(TokenKey.REFRESH_TOKEN, response.result.refreshToken);

        return 202;
      } else {
        return 401;
      }
    }
  }

  static Future<int> logOut() async {
    var box = await Hive.openBox(HiveBoxes.CONFIGURATION);
    var token = box.get(TokenKey.ACCESS_TOKEN);

    var code = await SignInApiService.logOut(token);
    if (code == 200) {
      return 200;
    }
  }

  static Future<Result<TokenPair>> _refreshToken() async {
    var box = await Hive.openBox(HiveBoxes.CONFIGURATION);
    var token = box.get(TokenKey.REFRESH_TOKEN);

    return SignInApiService.refreshToken(token);
  }
}
