import 'package:flutter/material.dart';
import 'package:flutter_application/bloc_arch/home/widget/home_screen.dart';
import 'package:flutter_application/bloc_arch/splash/component/splash_component.dart';
import 'package:flutter_application/utills/hive/hive_boxes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'bloc_arch/signin/widget/sign_in_screen_test.dart';
import 'bloc_arch/splash/widget/splash_screen.dart';

// *
// !
// ?
// TODO:

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveBoxes.CONFIGURATION);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          LoginPage.routeName: (context) => LoginPage(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BlocProvider(
            create: (context) => SplashComponent(), child: SplashScreen()));
  }
}
