import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_stu/bloc_arch/home/widget/home_screen.dart';
import 'package:graduate_stu/bloc_arch/signin/data/api/sign_in_api_service.dart';
import 'package:graduate_stu/bloc_arch/signin/data/repository/sign_in_repository.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login_page';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    final email = TextFormField(
      onChanged: _changeEmail,
      initialValue: "modelov.n.a@mail.ru",
      keyboardType: TextInputType.emailAddress,
      cursorColor: Theme.of(context).cursorColor,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(0),
        isDense: true,
        labelText: 'Email',
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff0881D1)),
        ),
      ),
    );

    final password = TextFormField(
      onChanged: _changePassword,
      initialValue: "4jpFjMbYww5B",
      keyboardType: TextInputType.visiblePassword,
      cursorColor: Theme.of(context).cursorColor,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(0),
        isDense: true,
        labelText: 'Пароль',
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff0881D1)),
        ),
      ),
    );

    final loginButton = Container(
      width: double.infinity,
      height: 42.0,
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: () async {
          var response = await SignInRepository.signIn(
              LoginInfo(email: _email, password: _password));
          if (response == 202) {
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          }
        },
        padding: EdgeInsets.all(10.0),
        color: Color(0xff0881D1),
        textColor: Colors.white,
        child: Text(
          "Войти",
          style: TextStyle(fontSize: 14),
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Не можете войти? Напишите нам',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
}
