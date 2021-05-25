import 'package:flutter/material.dart';
import 'package:flutter_application/bloc_arch/common/error_screen.dart';
import 'package:flutter_application/bloc_arch/profile/component/profile_component.dart';
import 'package:flutter_application/bloc_arch/profile/data/model/profile_model.dart';
import 'package:flutter_application/bloc_arch/profile/states/profile_state.dart';
import 'package:flutter_application/bloc_arch/settings/widget/setting_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  static const String routerName = "/profile_screen";

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileComponent(),
      child: BlocBuilder<ProfileComponent, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading || state is ProfileInitial) {
            return CircularProgressIndicator();
          } else if (state is ProfileSuccess) {
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
                child: buildColumn(context, state.profile),
              ),
            );
          } else {
            return ErrorScreen();
          }
        },
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

  Column buildColumn(BuildContext context, Profile profile) {
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
                    profile.imageUrl,
                  ),
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
                "${profile.firstName} ${profile.secondName}",
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
                Text(profile.yearGraduate),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  height: 15,
                  width: 2,
                  color: Colors.grey,
                ),
                Text(profile.scopeGroup.group),
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
                Text(profile.locate),
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
                    info: '${profile.firstName} ${profile.secondName} ${profile.patronymic == null ?  "" : profile.patronymic }',
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  getInfoCard(
                    label: 'Дата рождения',
                    info: '${profile.birthday}',
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  getInfoCard(
                    label: 'Факультет',
                    info: '${profile.scopeGroup.faculty}',
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  getInfoCard(
                    label: 'Специальность',
                    info:
                        '${profile.scopeGroup.specialty}',
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  getInfoCard(
                    label: 'Достижения',
                    info: '${profile.achievement}',
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  getInfoCard(
                    label: 'Местоположение',
                    info: '${profile.locate}',
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  getInfoCard(
                    label: 'Место работы',
                    info: '${profile.workPlace}',
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
