import 'package:flutter/material.dart';
import 'package:flutter_application/data/model/students_test_data.dart';
import 'package:grouped_list/grouped_list.dart';

class GraduateStudents extends StatelessWidget {
  Widget build(BuildContext context) {
    return  Scaffold(
        extendBody: true,
        appBar: buildAppBar(),
        body: groupedYearListView(),
      
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.0,
    title: const Text(
      "Выпускники",
      style: TextStyle(
        color: Colors.black,
        fontSize: 24,
      ),
    ),
    actions: <Widget>[
      IconButton(
        color: Colors.black,
        icon: Icon(Icons.search),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.filter_list, color: Colors.black),
        onPressed: () {},
      ),
    ],
  );
}

Widget groupedYearListView() {
  return GroupedListView<YearGraduate, String>(
    padding: const EdgeInsets.only(bottom: 80),
    elements: yearGraduate,
    groupBy: (element) => element.year,
    groupComparator: (value1, value2) => value2.compareTo(value1),
    order: GroupedListOrder.DESC,
    groupHeaderBuilder: (element) => Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            element.year,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.grey),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey,
              height: 2,
              thickness: 1,
              indent: 12,
              endIndent: 0,
            ),
          ),
        ],
      ),
    ),
    indexedItemBuilder: (context, element, index) {
      return Container(
        margin: new EdgeInsets.only(top: 0),
        child: groupedGroupListView(element.students, index),
      );
    },
  );
}

Widget groupedGroupListView(List<StudentItem> students, int index) {
  return GroupedListView<StudentItem, String>(
    shrinkWrap: true,
    physics: ClampingScrollPhysics(),
    elements: students,
    groupBy: (element) => element.group,
    groupComparator: (value1, value2) => value2.compareTo(value1),
    order: GroupedListOrder.DESC,
    groupHeaderBuilder: (element) {
      return Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
        child: Text(
          element.group,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      );
    },
    indexedItemBuilder: (context, element, index) {
      return Container(
        margin: new EdgeInsets.only(top: 7.5),
        child: ListTile(
          onTap: () => Navigator.pushNamed(context, '/person_info'),
          leading: Container(
            height: 60,
            width: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://picsum.photos/250?image=9"),
                fit: BoxFit.fill,
              ),
              border: Border.all(
                color: Colors.transparent, // set border color
                width: 0,
              ), // set border width
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ), // set rounded corner radius
              // make rounded corner of border
            ),
          ),
          title: Text(element.name),
        ),
      );
    },
  );
}
