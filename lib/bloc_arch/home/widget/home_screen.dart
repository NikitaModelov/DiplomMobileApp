import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:graduate_stu/bloc_arch/editprofile/edit_profile_screen.dart';
import 'package:graduate_stu/bloc_arch/filter/filter_screen.dart';
import 'package:graduate_stu/bloc_arch/graduateinfo/widget/graduate_info_screen.dart';
import 'package:graduate_stu/bloc_arch/graduates/widget/graduate_list_screen.dart';
import 'package:graduate_stu/bloc_arch/profile/widget/profile_screen.dart';
import 'package:graduate_stu/bloc_arch/settings/widget/setting_screen.dart';
import 'package:graduate_stu/bloc_arch/splash/widget/splash_screen.dart';
import 'package:graduate_stu/screens/faculty.dart';
import 'package:graduate_stu/screens/party.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    GraduateListScreen(),
    Faculty(),
    Party(),
    ProfileScreen(),
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
        SettingsScreen.routerName: (context) => SettingsScreen(),
        SplashScreen.routerName: (context) => SplashScreen(),
        EditProfileScreen.routerName: (context) => EditProfileScreen(),
        FilterScreen.routerName: (context) => FilterScreen(),
        GraduateListScreen.routeName: (context) => GraduateListScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
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
