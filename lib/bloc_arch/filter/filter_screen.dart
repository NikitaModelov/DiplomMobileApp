import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_stu/bloc_arch/graduates/widget/graduate_list_screen.dart';
import 'package:graduate_stu/bloc_arch/home/widget/home_screen.dart';

class FilterScreen extends StatefulWidget {
  static const String routerName = "/filter";

  @override
  State<StatefulWidget> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  DateTime _selectedDate = DateTime.now();
  String _dropDownValue;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {

    AppBar _appBar(BuildContext context) =>
        AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            "Фильтр",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: Icon(Icons.done, color: Colors.black),
              onPressed: () {
                Navigator.pop(context, {"year" : _selectedDate, "group": _dropDownValue});
              },
            ),
          ],
        );

    return Scaffold(
      appBar: _appBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: 16.0, end: 16.0, top: 20.0, bottom: 16.0),
            child: Text(
              "Год выпуска",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            padding: EdgeInsetsDirectional.only(
              start: 16.0,
              end: 16.0,
            ),
            height: 300,
            child: YearPicker(
              firstDate: DateTime(DateTime
                  .now()
                  .year - 90, 1),
              lastDate: DateTime(DateTime
                  .now()
                  .year, 1),
              initialDate: DateTime.now(),
              selectedDate: _selectedDate,
              onChanged: (DateTime dateTime) {
                setState(() {
                  _selectedDate = dateTime;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
            child: DropdownButton(
              hint: _dropDownValue == null
                  ? Text(
                'Группа',
                style: TextStyle(fontSize: 18),
              )
                  : Text(
                _dropDownValue,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              isExpanded: true,
              iconSize: 30.0,
              style: TextStyle(color: Colors.blue),
              items: ['БИСТ-411', 'БПИ-411', 'МЛ-411', 'Все'].map(
                    (val) {
                  return DropdownMenuItem<String>(
                    value: val,
                    child: Text(
                      val,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  );
                },
              ).toList(),
              onChanged: (val) {
                setState(
                      () {
                    _dropDownValue = val.toString();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
