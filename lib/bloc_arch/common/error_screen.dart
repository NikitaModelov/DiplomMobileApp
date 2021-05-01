import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      physics: const AlwaysScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: 120,
                child: Lottie.asset('assets/anim/sad_emoji.json'),
              ),
              SizedBox(
                height: 20,
              ),
              Flexible(
                child: Text("К сожалению что-то пошло не так.\n"
                    "Проверьте подключение к интернету и попробуйте снова.",
                  textAlign: TextAlign.center,
                  style: TextStyle(),),
              )
            ],
          ),
        )
      ],
    );
  }
}
