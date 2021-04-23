import 'package:flutter/material.dart';
import 'package:flutter_application/data/repository/graduates_repository.dart';
import 'package:flutter_application/screens/faculty.dart';
import 'package:flutter_application/screens/graduate_students.dart';
import 'package:flutter_application/screens/party.dart';
import 'package:flutter_application/screens/person_info.dart';
import 'package:flutter_application/screens/profile.dart';
import 'package:flutter_application/screens/setting.dart';
import 'package:fluttertoast/fluttertoast.dart';

DateTime currentBackPressTime;

class Home extends StatefulWidget {
  @override
  _HomeStatefulWidgetState createState() => _HomeStatefulWidgetState();
}

class _HomeStatefulWidgetState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    GraduateStudents(),
    Faculty(),
    Party(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          if (settings.name == PersonInfo.routeName) {
            final GraduateStudentsArguments args =
                settings.arguments as GraduateStudentsArguments;
            return MaterialPageRoute(
              builder: (context) {
                return PersonInfo(GraduatesRepository(), args.idStudents);
              },
            );
          }
        },
        routes: {
          '/graduate_students': (context) => GraduateStudents(),
          '/setting': (context) => Settings(),
        },
        home: Scaffold(
          extendBody: true,
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.group),
                label: "Выпускники",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: "Факультет",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.nightlife),
                label: "Встречи",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Профиль",
              ),
            ],
            currentIndex: _selectedIndex,
            unselectedItemColor: Colors.grey[600],
            selectedItemColor: Color(0xff0881D1),
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Для выхода нажмите еще раз');
      return Future.value(false);
    }
    return Future.value(true);
  }
}
