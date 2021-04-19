import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoLinkHelper {
  static AssetImage getLogoImage(TypeLink type) {
    switch (type) {
      case TypeLink.vk:
        return AssetImage("assets/logo/vk.png");
      case TypeLink.instagram:
        return AssetImage("assets/logo/instagram.png");
      case TypeLink.tikTok:
        return AssetImage("assets/logo/tik_tok.png");
      case TypeLink.ok:
        return AssetImage("assets/logo/ok.png");
      case TypeLink.telegram:
        return AssetImage("assets/logo/telegram.png");
      case TypeLink.twitter:
        return AssetImage("assets/logo/twitter.png");
      case TypeLink.youTube:
        return AssetImage("assets/logo/you_tube.png");
      case TypeLink.facebook:
        return AssetImage("assets/logo/facebook.png");
      case TypeLink.eMail:
      // Todo: Разобраться с этой иконкой
        return AssetImage("assets/logo/e_mail.png");
        break;
    }
  }
}

enum TypeLink {
  vk,
  instagram,
  tikTok,
  eMail,
  ok,
  telegram,
  twitter,
  youTube,
  facebook
}
