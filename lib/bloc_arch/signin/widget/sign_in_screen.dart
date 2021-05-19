import 'package:flutter/material.dart';
import 'package:flutter_application/bloc_arch/common/error_screen.dart';
import 'package:flutter_application/bloc_arch/home/widget/home_screen.dart';
import 'package:flutter_application/bloc_arch/signin/component/sign_in_component.dart';
import 'package:flutter_application/bloc_arch/signin/data/api/sign_in_api_service.dart';
import 'package:flutter_application/bloc_arch/signin/event/sign_in_events.dart';
import 'package:flutter_application/bloc_arch/signin/state/sign_in_state.dart';
import 'package:flutter_application/utills/size.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInScreenState();
  }
}

class _SignInScreenState extends State<SignInScreen> {
  String _email = "";
  String _password = "";

  _changeEmail(String text) {
    setState(() => _email = text);
  }

  _changePassword(String text) {
    setState(() => _password = text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingInComponent(),
      child: BlocBuilder<SingInComponent, SignInState>(
        builder: (context, state) {
          if (state is SignInInitial) {
            return buildWidget();
          } else if (state is SignInLoading) {
            return Scaffold(
              body: Text("Загрузка"),
            );
          } else if (state is SignInSuccess) {
            // ignore: missing_returnf
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else {
            return ErrorScreen();
          }
        },
      ),
    );
  }

  Widget buildWidget() {
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
                            onChanged: _changeEmail,
                            cursorColor: Theme.of(context).cursorColor,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              isDense: true,
                              labelText: 'Email',
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
                            onChanged: _changePassword,
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
                            () async {
                              BlocProvider.of<SingInComponent>(context)
                                  .add(SignInRequested(
                                LoginInfo(
                                  email: _email,
                                  password: _password,
                                ),
                              ));
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
                                  builder: (BuildContext context) =>
                                      HomeScreen(),
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
