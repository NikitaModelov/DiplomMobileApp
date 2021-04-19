import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Party extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 120,
          height: 120,
          child: Lottie.asset('assets/anim/in_dev.json'),
        ),
      ),
    );
  }
}
