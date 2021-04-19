import 'package:flutter/cupertino.dart';

class GraduateInfo {
  final String firstName;
  final String secondName;
  final String patronymic;
  final String yearGraduate;
  final String group;
  final String locate;
  final String birthDay;
  final String faculty;
  final String speciality;
  final String placeWork;
  final String achievement;
  final String urlImage;

  GraduateInfo(
      {@required this.firstName,
      @required this.secondName,
      @required this.patronymic,
      @required this.yearGraduate,
      @required this.group,
      @required this.locate,
      @required this.birthDay,
      @required this.faculty,
      @required this.speciality,
      @required this.achievement,
      @required this.placeWork,
      @required this.urlImage});
}
