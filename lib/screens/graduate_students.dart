import 'package:flutter/material.dart';
import 'package:flutter_application/data/model/graduate_card.dart';
import 'package:flutter_application/data/model/students_test_data.dart';
import 'package:flutter_application/screens/person_info.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:flutter_application/data/repository/graduates_repository.dart';

class GraduateStudentsArguments {
  final int idStudents;

  GraduateStudentsArguments(this.idStudents);
}

class GraduateStudents extends StatefulWidget {
  final GraduatesRepository _repository = GraduatesRepository();

  @override
  State<StatefulWidget> createState() => _GraduateStudentsState();
}

class _GraduateStudentsState extends State<GraduateStudents>
    with SingleTickerProviderStateMixin {
  bool _isLoading = true;
  List<GraduateCard> _elements;

  @override
  void initState() {
    super.initState();
    print('INIT');
    widget._repository
        .getGraduates("2021", "Бизнес-информатика")
        .then((value) => {
              setState(() {
                _elements = value;
                _isLoading = false;
                print('Console Message Using Print');
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: buildAppBar(),
      body: _isLoading ? _buildLoading() : groupedYearListView(_elements),
    );
  }
}

Widget _buildLoading() {
  return const Center(
    child: CircularProgressIndicator(),
  );
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

Widget groupedYearListView(List<GraduateCard> list) {
  return GroupedListView<GraduateCard, String>(
    padding: const EdgeInsets.only(bottom: 80),
    elements: list,
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
          onTap: () {
            Navigator.pushNamed(
              context,
              PersonInfo.routeName,
              arguments: GraduateStudentsArguments(element.id),
            );
          },
          leading: Container(
            height: 60,
            width: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(element.urlImage),
                fit: BoxFit.cover,
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
          title: Text(
              "${element.secondName} ${element.firstName} ${element.patronymic}"),
        ),
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
