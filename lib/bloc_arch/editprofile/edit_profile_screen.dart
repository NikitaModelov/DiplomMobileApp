import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routerName = "/edit_profile";

  @override
  State<StatefulWidget> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfileScreen> {
  AppBar _appBar(BuildContext context) => AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Редактирование",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.done, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );



  @override
  Widget build(BuildContext context) {

    TextFormField _textFieldLocal() => TextFormField(
      //onChanged: _changePassword,
      keyboardType: TextInputType.visiblePassword,
      cursorColor: Theme.of(context).cursorColor,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(0),
        isDense: true,
        labelText: "Местоположение",
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff0881D1)),
        ),
      ),
    );

    TextFormField _textFieldWorkPlace() => TextFormField(
      //onChanged: _changePassword,
      keyboardType: TextInputType.visiblePassword,
      cursorColor: Theme.of(context).cursorColor,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(0),
        isDense: true,
        labelText: "Место работы",
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff0881D1)),
        ),
      ),
    );

    return Scaffold(
      appBar: _appBar(context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
            child: Text(
              "К сожалению, для избежания неточности информации,"
              " Вам необходимо оставить заявку на изменения "
              "Ваших личных данных администратору. "
              "Но Вы можете изменить свое текущие местоположение "
              "и место работы. Приносим свои "
              "извенения за предоставленые неудобства.",
              softWrap: true,
            ),
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
                child: Text('Оставить заявку'),
              ),
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: _textFieldLocal(),
          ),
          SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: _textFieldWorkPlace(),
          ),
          SizedBox(height: 16,),
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
                child: Text('Сохранить'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
