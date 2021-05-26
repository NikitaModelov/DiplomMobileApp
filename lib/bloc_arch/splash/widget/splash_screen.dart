import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_stu/bloc_arch/home/widget/home_screen.dart';
import 'package:graduate_stu/bloc_arch/signin/widget/sign_in_screen_test.dart';
import 'package:graduate_stu/bloc_arch/splash/component/splash_component.dart';
import 'package:graduate_stu/bloc_arch/splash/states/splash_states.dart';

class SplashScreen extends StatefulWidget {
  static const String routerName = "/splash";

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _loadWidget = Scaffold(
    backgroundColor: Colors.white,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(),
          Column(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Загрузка данных ...',
              ),
            ],
          ),
        ],
      ),
    ),
  );

  final _failWidget = Scaffold(
    backgroundColor: Colors.white,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(),
        Column(
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 20,
            ),
            Text(
              'Ошибка авторизации ...',
            ),
          ],
        ),
      ],
    ),
  );

  final _successWidget = Scaffold(
    backgroundColor: Colors.white,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(),
        Column(
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 20,
            ),
            Text(
              'Успех ...',
            ),
          ],
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: BlocProvider.of<SplashComponent>(context),
      listener: (context, state) {
        if (state is SplashSuccess) {
          debugPrint("Success state");
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        } else if (state is SplashFailure) {
          debugPrint("Error state");
          Navigator.pushReplacementNamed(context, LoginPage.routeName);
        }
      },
      builder: (context, state) {
        if (state is SplashInitial || state == null) {
          return _loadWidget;
        } else if (state is SplashSuccess) {
          return _successWidget;
        } else {
          return _failWidget;
        }
      },
    );
  }

/*@override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashComponent(),
      child: BlocListener(
        bloc: BlocProvider.of<SplashComponent>(context),
        listener: (context, state) {
          if (state is SplashSuccess) {
            debugPrint("Success state");
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          } else {
            debugPrint("Error state");
            Navigator.pushReplacementNamed(context, LoginPage.routeName);
          }
        },
        child: BlocBuilder(
          bloc: BlocProvider.of<SplashComponent>(context),
          builder: (context, state) {
            if (state is SplashInitial || state == null) {
              debugPrint("Initial state");
              return _loadWidget;
            } else if (state is SplashSuccess) {
              debugPrint("Success state");
              return _successWidget;
            } else {
              debugPrint("Error state");
              return _failWidget;
            }
          },
        ),
      ),
    );
  }*/
}
