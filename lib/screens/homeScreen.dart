import 'package:flutter/material.dart';
import 'package:educationappteacher/screens/modelHomeScreen.dart';
import 'package:educationappteacher/screens/profileScreen.dart';
import 'package:educationappteacher/screens/calendarScreen.dart';

class ThirdHomeStudents extends StatefulWidget {
  const ThirdHomeStudents({Key? key}) : super(key: key);
  @override
  _ThirdHomeStudentsState createState() => _ThirdHomeStudentsState();
}

class _ThirdHomeStudentsState extends State<ThirdHomeStudents> {
  var _selectedIndex = 0;
  List<Widget> _widgetNavBar = <Widget>[
    ModelNotiStudents(),
    Calendar(),
    FourthManageProfileStudents(),
  ];
  void _tapNavBar(var index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: _widgetNavBar.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _tapNavBar,
          selectedItemColor: Colors.red[300],
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined),
              label: "Activity",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_view_month),
              label: "Calendar",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined),
              label: "Account",
            )
          ],
        ),
      ),
    );
  }
}
