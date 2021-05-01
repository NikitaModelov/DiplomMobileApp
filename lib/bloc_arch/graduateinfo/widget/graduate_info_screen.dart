import 'package:flutter/material.dart';
import 'package:flutter_application/bloc_arch/graduates/widget/graduate_list_screen.dart';

class GraduateInfoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GraduateInfoScreenState();

}

class _GraduateInfoScreenState extends State<GraduateInfoScreen> {

  @override
  Widget build(BuildContext context) {

    final GraduateListScreenArg arg = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Студент ${arg.id}"),
        ),
      ),
    );
  }
}