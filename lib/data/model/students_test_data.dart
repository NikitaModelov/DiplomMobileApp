import 'package:flutter/material.dart';

class StudentItem {
  final String name;
  final String group;
  final String urlImage;

  StudentItem({@required this.name, @required this.group, this.urlImage = ""});
}

class YearGraduate {
  final String year;
  final List<StudentItem> students;

  YearGraduate({@required this.year, @required this.students});
}

final List<YearGraduate> yearGraduate = [
  YearGraduate(
    year: "2021",
    students: [
      StudentItem(
        name: "Фамилия Имя Отчество Отчество",
        group: "БИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "БИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "БИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "БПИ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "БПИ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество last",
        group: "БПИ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество last",
        group: "МИСТ-411",
      ),
    ],
  ),
  YearGraduate(
    year: "2020",
    students: [
      StudentItem(
        name: "Фамилия Имя Отчество Отчество",
        group: "БИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "БИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество last",
        group: "БИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "БПИ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "БПИ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество last",
        group: "БПИ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество",
        group: "МИСТ-411",
      ),
      StudentItem(
        name: "Фамилия Имя Отчество last",
        group: "МИСТ-411",
      ),
    ],
  ),
];
