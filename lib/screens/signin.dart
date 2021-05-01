import 'package:flutter/material.dart';
import 'package:flutter_application/bloc_arch/home/widget/home_screen.dart';
import 'package:flutter_application/utills/size.dart';

class SignInScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return Scaffold(
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowGlow();
              return;
            },
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    header(context),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextFormField(
                            cursorColor: Theme.of(context).cursorColor,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              isDense: true,
                              labelText: 'Логин',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0881D1)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            obscureText: false,
                            cursorColor: Theme.of(context).cursorColor,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              isDense: true,
                              labelText: 'Пароль',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0881D1)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          customButton(
                            Color(0xff0881D1),
                            Text(
                              "Войти",
                              style: TextStyle(fontSize: 14),
                            ),
                            () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => HomeScreen()),
                              );
                            },
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          customButton(
                            Color(0xff0063A5),
                            Text(
                              "Использовать QR-code",
                              style: TextStyle(fontSize: 14),
                            ),
                            () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => HomeScreen(),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 25,
                            ),
                            child: Text("Не можете войти? Напишите нам"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget customButton(Color color, Text text, Function onPressed) {
    return Container(
      width: double.infinity,
      height: 42.0,
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: onPressed,
        padding: EdgeInsets.all(10.0),
        color: color,
        textColor: Colors.white,
        child: text,
      ),
    );
  }

  Widget header(BuildContext context) {
    return Container(
      height: displaySize(context).height * 0.4,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/background_signin.png'),
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: displaySize(context).height * 0.2,
            left: 16,
            child: Container(
              child: Text("Добро пожаловать,\nвыпускник!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
