import 'package:flutter/cupertino.dart';
import 'package:graduate_stu/data/model/graduate_card.dart';

class GraduateInfo {
  final String id;
  final String firstName;
  final String secondName;
  final String patronymic;
  final String yearGraduate;
  final String email;
  final String locate;
  final String birthDay;
  final UserScope scope;
  final List<dynamic> links;
  final String placeWork;
  final String achievement;
  final String urlImage;

  GraduateInfo(
      {@required this.id,
      @required this.firstName,
      @required this.secondName,
      @required this.patronymic,
      @required this.email,
      @required this.yearGraduate,
      @required this.locate,
      @required this.birthDay,
      @required this.scope,
      @required this.links,
      @required this.achievement,
      @required this.placeWork,
      @required this.urlImage});

  factory GraduateInfo.fromJson(Map<String, dynamic> json) {
    return GraduateInfo(
        id: json['_id'],
        firstName: json['firstName'],
        yearGraduate: json['yearGraduate'],
        secondName: json['secondName'],
        urlImage: json['imageUrl'],
        patronymic: json['patronymic'],
        birthDay: json['birthday'],
        achievement: json['achievement'],
        links: json['links'],
        placeWork: json['workPlace'],
        scope: UserScope.fromJson(json['scope']),
        locate: json['locate']);
  }
}
