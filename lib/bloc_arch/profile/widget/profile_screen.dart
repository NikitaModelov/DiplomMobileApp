import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_stu/bloc_arch/common/error_screen.dart';
import 'package:graduate_stu/bloc_arch/editprofile/edit_profile_screen.dart';
import 'package:graduate_stu/bloc_arch/profile/component/profile_component.dart';
import 'package:graduate_stu/bloc_arch/profile/data/model/profile_model.dart';
import 'package:graduate_stu/bloc_arch/profile/states/profile_states.dart';
import 'package:graduate_stu/bloc_arch/settings/widget/setting_screen.dart';
import 'package:graduate_stu/utills/logo_link_helper.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AppBar _appBar(BuildContext context) => AppBar(
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
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileComponent(),
      child: BlocBuilder<ProfileComponent, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoadingState || state is ProfileInitialState) {
            return CircularProgressIndicator();
          } else if (state is ProfileSuccessState) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: _appBar(context),
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
}

Column buildColumn(BuildContext context, Profile profile) {
  var links = profile.links;
  links.add("add");

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
                  profile.urlImage,
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
              Text("${profile.yearGraduate} год"),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                height: 15,
                width: 2,
                color: Colors.grey,
              ),
              Text(profile.scope.group),
            ],
          ),
          SizedBox(
            height: 10,
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
            height: 100,
            child: ListView.builder(
              padding: EdgeInsetsDirectional.only(
                  start: 16.0, end: 16.0, top: 10, bottom: 10),
              scrollDirection: Axis.horizontal,
              itemCount: links.length,
              itemBuilder: (context, index) {
                if (links[index] != "add") {
                  return Container(
                    width: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: LogoLinkHelper.getLogoImage(TypeLink.vk),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 4.0),
                          spreadRadius: 0.0,
                          blurRadius: 4.0,
                        ),
                      ],
                      border: Border.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(18.0),
                      ),
                    ),
                    margin: index > 0
                        ? EdgeInsets.only(left: 16)
                        : EdgeInsets.only(left: 0),
                  );
                } else {
                  return Container(
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 4.0),
                          spreadRadius: 0.0,
                          blurRadius: 4.0,
                        ),
                      ],
                      border: Border.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(18.0),
                      ),
                    ),
                    margin: index > 0
                        ? EdgeInsets.only(left: 16)
                        : EdgeInsets.only(left: 0),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 45,
                        color: Colors.black54,
                      ),
                    ),
                  );
                }
              },
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
                  info:
                      '${profile.secondName} ${profile.firstName} ${profile.patronymic}',
                ),
                SizedBox(
                  height: 14,
                ),
                getInfoCard(
                  label: 'Дата рождения',
                  info: '${profile.birthDay}',
                ),
                SizedBox(
                  height: 14,
                ),
                getInfoCard(
                  label: 'Факультет',
                  info: profile.scope.faculty,
                ),
                SizedBox(
                  height: 14,
                ),
                getInfoCard(
                  label: 'Специальность',
                  info: profile.scope.specialty,
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
                  info: '${profile.placeWork}',
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
              Navigator.pushNamed(context, EditProfileScreen.routerName);
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
