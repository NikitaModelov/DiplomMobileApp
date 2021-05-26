import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_stu/utills/logo_link_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkDialog extends StatelessWidget {
  final String firstName;
  final List<dynamic> links;

  LinkDialog({@required this.firstName, @required this.links});

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
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Container(
                height: 170,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      maxCrossAxisExtent: 80),
                  itemBuilder: (context, index) {
                    return _linkButton(type: TypeLink.vk, link: links[index]);
                  },
                  itemCount: links.length,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _info
            ],
          ),
        ),
      ),
    );
  }

  String parseUrl(String value) {
    return value.replaceAll('https://', '');
  }

  var _info = Text(
    "Пожалуйста, уважайте чужую личную жизнь.",
    style: TextStyle(
      fontSize: 12,
      color: Colors.grey,
      fontWeight: FontWeight.bold,
    ),
  );

  Container _buildRowLink({@required TypeLink type, @required String link}) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: LogoLinkHelper.getLogoImage(type),
        ),
      ),
    );
  }

  Container _linkButton({@required TypeLink type, @required String link}) {
    return Container(
      height: 40,
      width: 40,
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Ink.image(
          image: LogoLinkHelper.getLogoImage(TypeLink.vk),
          fit: BoxFit.fill,
          child: InkWell(
            onTap: () {
              launch(link);
            },
          ),
        ),
      ),
    );
  }
}
