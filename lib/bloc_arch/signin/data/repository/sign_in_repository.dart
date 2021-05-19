import 'package:flutter_application/bloc_arch/signin/data/api/sign_in_api_service.dart';
import 'package:flutter_application/utills/hive_boxes.dart';
import 'package:flutter_application/utills/token_key.dart';
import 'package:hive/hive.dart';

class SignInRepository {
  static Future<int> signIn(LoginInfo loginInfo) async {
    var response = await SignInApiService.signIn(loginInfo);

    if (response.result != null) {
      var box = Hive.box(HiveBoxes.CONFIGURATION);

      box.put(TokenKey.ACCESS_TOKEN, response.result.token);
      box.put(TokenKey.REFRESH_TOKEN, response.result.refreshToken);
    }

    return response.statusCode;
  }
}
