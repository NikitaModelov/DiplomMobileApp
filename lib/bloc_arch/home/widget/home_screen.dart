import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/bloc_arch/graduateinfo/widget/graduate_info_screen.dart';
import 'package:flutter_application/bloc_arch/graduates/widget/graduate_list_screen.dart';
import 'package:flutter_application/screens/faculty.dart';
import 'package:flutter_application/screens/party.dart';
import 'package:flutter_application/screens/profile.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    GraduateListScreen(),
    Faculty(),
    Party(),
    Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        GraduateInfoScreen.routeName: (context) => GraduateInfoScreen(),
      },
      home: Scaffold(
        extendBody: true,
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            content: Text('Tap back again to leave'),
          ),
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
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
    );
  }
}