import 'package:flutter/cupertino.dart';

class GraduateInfo {
  final int id;
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
      {@required this.id,
      @required this.firstName,
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

  factory GraduateInfo.fromJson(Map<String, dynamic> json) {
    return GraduateInfo(
        id: json['id'],
        firstName: json['firstName'],
        yearGraduate: json['yearGraduate'],
        secondName: json['secondName'],
        urlImage: json['urlImage'],
        patronymic: json['patronymic'],
        group: json['group'],
        birthDay: json['birthDay'],
        speciality: json['speciality'],
        achievement: json['achievement'],
        placeWork: json['placeWork'],
        faculty: json['faculty'],
        locate: json['locate']);
  }
}
