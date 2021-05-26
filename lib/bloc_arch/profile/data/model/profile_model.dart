import 'package:graduate_stu/data/model/graduate_card.dart';

class Profile {
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

  Profile(
      {this.id,
        this.firstName,
        this.secondName,
        this.patronymic,
        this.email,
        this.yearGraduate,
        this.locate,
        this.birthDay,
        this.scope,
        this.links,
        this.achievement,
        this.placeWork,
        this.urlImage});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
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
