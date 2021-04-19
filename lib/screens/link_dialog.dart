import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/utills/logo_link_helper.dart';

class LinkDialog extends StatelessWidget {
  final String firstName;

  LinkDialog({@required this.firstName});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Для связи с $firstName, воспользуйтесь одной из социальных сетей.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildRowLink(
                    link: "@jhfdsljfhbdsf",
                    type: TypeLink.vk,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _buildRowLink(
                    link: "@jhfdsljfhbdsf",
                    type: TypeLink.instagram,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _buildRowLink(
                    link: "@jhfdsljfhbdsf",
                    type: TypeLink.tikTok,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _buildRowLink(
                    link: "jhfds@ljfhbd.ru",
                    type: TypeLink.youTube,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Пожалуйста, уважайте чужую личную жизнь.",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _buildRowLink({@required TypeLink type, @required String link}) {
    return Row(
      children: [
        // LogoLinkHelper.getLogoImage(type),
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: LogoLinkHelper.getLogoImage(type),
            ),
          ),
        ),

        SizedBox(
          width: 8,
        ),
        Text("$link"),
      ],
    );
  }
}
