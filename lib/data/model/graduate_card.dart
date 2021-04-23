import 'package:flutter/cupertino.dart';

class GraduateCard {
  final int id;
  final String firstName;
  final String secondName;
  final String patronymic;
  final String yearGraduate;
  final String group;
  final String urlImage;

  GraduateCard(
      {@required this.id,
      @required this.firstName,
      @required this.secondName,
      @required this.patronymic,
      @required this.yearGraduate,
      @required this.group,
      @required this.urlImage});

  factory GraduateCard.fromJson(Map<String, dynamic> json) {
    return GraduateCard(
        firstName: json['firstName'],
        yearGraduate: json['yearGraduate'],
        secondName: json['secondName'],
        urlImage: json['urlImage'],
        patronymic: json['patronymic'],
        group: json['group'],
        id: json['id']);
  }
}
