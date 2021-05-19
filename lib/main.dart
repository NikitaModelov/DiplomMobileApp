import 'package:flutter/material.dart';
import 'package:flutter_application/bloc_arch/signin/widget/sign_in_screen.dart';
import 'package:flutter_application/utills/hive_boxes.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// *
// !
// ?
// TODO:

void main() async {
  await Hive.initFlutter();
  Hive.box(HiveBoxes.CONFIGURATION);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SignInScreen());
  }
}
