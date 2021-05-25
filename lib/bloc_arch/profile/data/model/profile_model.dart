import 'package:flutter_application/data/model/graduate_card.dart';

class Profile {
  final String id;
  final String firstName;
  final String secondName;
  final String patronymic;
  final String email;
  final String locate;
  final String birthday;
  final List<String> links;
  final String achievement;
  final String workPlace;
  final String imageUrl;
  final String yearGraduate;

  final UserScope scopeGroup;

  Profile(
      {this.id,
      this.firstName,
      this.secondName,
      this.patronymic,
      this.email,
      this.locate,
      this.birthday,
      this.links,
      this.achievement,
      this.workPlace,
      this.imageUrl,
      this.yearGraduate,
      this.scopeGroup});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        id: json["id"],
        firstName: json["firstName"],
        secondName: json["secondName"],
        patronymic: json["patronymic"],
        email: json["email"],
        locate: json["locate"],
        birthday: json["birthday"],
        links: json["links"],
        achievement: json["achievement"],
        workPlace: json["workPlace"],
        imageUrl: json["imageUrl"],
        yearGraduate: json["yearGraduate"]);
  }
}
