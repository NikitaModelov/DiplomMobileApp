import 'package:flutter_application/data/model/graduate_info.dart';

class GraduatesRepository {
  Future<GraduateInfo> getGraduateInfo() async {
    await Future.delayed(
      Duration(seconds: 2),
    );
    return GraduateInfo(
        firstName: "Дарья",
        secondName: "Открывашкина",
        patronymic: "Ивановна",
        yearGraduate: "2021 год",
        group: "СМТ-511",
        faculty: "Мосты и тоннели",
        speciality:
            "Строительство железных дорог, мостов и транспортных тоннелей",
        achievement: "Закончила с красным дипломом",
        birthDay: "11.06.1999",
        locate: "г. Москва",
        placeWork: "Москва-Маурер-Мост",
        urlImage:
            'https://images.pexels.com/photos/6533841/pexels-photo-6533841.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260');
  }
}
