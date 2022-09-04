import 'package:classapp/features/attendance/views/attendance_view.dart';
import 'package:classapp/features/daily-updates/views/daily_updates_view.dart';
import 'package:classapp/features/dashboard/views/dashboard_view.dart';
import 'package:classapp/features/leaves/views/leaves_view.dart';
import 'package:classapp/features/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [
    DashboardView(),
    DailyUpdatesView(),
    AttendanceView(),
    LeavesView(),
    ProfileView()
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex == 0) {
          SystemNavigator.pop();
        } else {
          setState(() {
            _currentIndex = 0;
          });
        }
        return false;
      },
      child: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard,
                ),
                label: "Dashboard"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.update,
                ),
                label: "Update"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.insights,
                ),
                label: "Attendance"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.holiday_village,
                ),
                label: "Leaves"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Profile"),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  final String name;
  const TitleWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: TextStyle(fontSize: 40),
      ),
      subtitle: Text("Karki"),
    );
  }
}
