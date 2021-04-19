import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Редактирование",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          children: [
            Text(
              "К сожалению, для избежания неточности информации," +
                  " Вам необходимо оставить заявку для изменения Ваших личных данных администратору." +
                  " Но Вы можете изменить свое текущее местоположение, место работы и фото профиля. Приносим " +
                  "свои извенения за доставленые неудобства.",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 42.0,
              child: RaisedButton(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                onPressed: () {},
                padding: EdgeInsets.all(10.0),
                color: Colors.blueGrey,
                textColor: Colors.white,
                child: Text('Оставить заявку'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            getEditBlock(context),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 42.0,
              child: RaisedButton(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                onPressed: () {},
                padding: EdgeInsets.all(10.0),
                color: Color(0xff0881D1),
                textColor: Colors.white,
                child: Text('Сохранить'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getEditBlock(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          cursorColor: Theme.of(context).cursorColor,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(0),
            isDense: true,
            labelText: 'Местоположение',
            labelStyle: TextStyle(
              color: Colors.grey,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff0881D1)),
            ),
          ),
        ),
        SizedBox(
              height: 16,
            ),
        TextFormField(
          cursorColor: Theme.of(context).cursorColor,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(0),
            isDense: true,
            labelText: 'Место работы',
            labelStyle: TextStyle(
              color: Colors.grey,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff0881D1)),
            ),
          ),
        ),
      ],
    );
  }
}
