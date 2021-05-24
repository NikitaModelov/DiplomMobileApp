import 'package:flutter/material.dart';
import 'package:flutter_application/bloc_arch/settings/widget/setting_screen.dart';
import 'package:flutter_application/utills/size.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "Профиль",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, SettingsScreen.routerName);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: 80,
        ),
        physics: BouncingScrollPhysics(),
        child: buildColumn(context),
      ),
    );
  }

  RawMaterialButton buildRawMaterialButton() {
    return RawMaterialButton(
      onPressed: () {},
      fillColor: Color.fromRGBO(255, 255, 255, 0.6),
      child: Icon(
        Icons.edit,
        color: Colors.black,
        size: 24,
      ),
      padding: EdgeInsets.all(0),
      shape: CircleBorder(),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  image: NetworkImage(
                      'https://images.pexels.com/photos/6732915/pexels-photo-6732915.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(100),
                color: Colors.red,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "Дарья Открывашкина",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("2021 год"),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  height: 15,
                  width: 2,
                  color: Colors.grey,
                ),
                Text("СМТ-511"),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_pin,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 2,
                ),
                Text("Новосибирск, Россия"),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Социальные сети",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    width: 80,
                    color: Colors.red,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    width: 80,
                    color: Colors.blue,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    width: 80,
                    color: Colors.green,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    width: 80,
                    color: Colors.yellow,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    width: 80,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Информация",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getInfoCard(
                    label: 'ФИО',
                    info: 'Открывашкина Дарья Ивановна',
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  getInfoCard(
                    label: 'Дата рождения',
                    info: '11.06.1999',
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  getInfoCard(
                    label: 'Факультет',
                    info: 'Мосты и тоннели',
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  getInfoCard(
                    label: 'Специальность',
                    info:
                        'Строительство железных дорог, мостов и транспортных тоннелей',
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  getInfoCard(
                    label: 'Достижения',
                    info: 'Закончила с красным дипломом',
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  getInfoCard(
                    label: 'Местоположение',
                    info: 'Новосибирск, Россия',
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  getInfoCard(
                    label: 'Место работы',
                    info: 'Москва-Маурер-Мост',
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
          child: Container(
            width: double.infinity,
            height: 42.0,
            child: RaisedButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/setting');
              },
              padding: EdgeInsets.all(10.0),
              color: Color(0xff0881D1),
              textColor: Colors.white,
              child: Text('Редактировать'),
            ),
          ),
        ),
      ],
    );
  }

  Column getInfoCard({@required String label, @required String info}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          info,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
