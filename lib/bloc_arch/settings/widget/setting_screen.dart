import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graduate_stu/bloc_arch/signin/data/repository/sign_in_repository.dart';
import 'package:graduate_stu/main.dart';

class SettingsScreen extends StatefulWidget {
  static const String routerName = "/settings";

  @override
  State<StatefulWidget> createState() => _SettingsScreen();
}

class _SettingsScreen extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsetsDirectional.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              height: 42.0,
              child: RaisedButton(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                onPressed: () async {
                  await SignInRepository.logOut();
                  RestartWidget.restartApp(context);
                },
                padding: EdgeInsets.all(10.0),
                color: Color(0xffFF002E),
                textColor: Colors.white,
                child: Text(
                  "Выйти",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: const Text(
        "Настройки",
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
