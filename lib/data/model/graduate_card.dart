import 'package:flutter/cupertino.dart';

class GraduateCard {
  final String id;
  final String firstName;
  final String secondName;
  final String patronymic;
  final String yearGraduate;
  final UserScope scope;
  final String urlImage;

  GraduateCard(
      {@required this.id,
      @required this.firstName,
      @required this.secondName,
      @required this.patronymic,
      @required this.yearGraduate,
      @required this.scope,
      @required this.urlImage});

  factory GraduateCard.fromJson(Map<String, dynamic> json) {
    return GraduateCard(
        firstName: json['firstName'],
        yearGraduate: json['yearGraduate'],
        secondName: json['secondName'],
        urlImage: json['imageUrl'],
        patronymic: json['patronymic'],
        scope: json['scope'],
        id: json['_id']);
  }
}

class UserScope {
  final String group;
  final String faculty;
  final String specialty;

  UserScope(
      {@required this.group, @required this.faculty, @required this.specialty});
}
