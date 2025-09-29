import 'package:flutter/material.dart';
import 'pages/dashboard_page.dart';
import 'pages/timetable_page.dart';
import 'pages/subject_page.dart';
import 'pages/attendance_page.dart';
import 'pages/classes_page.dart';
import 'pages/results_page.dart';
import 'pages/profile_page.dart';

class StudentLayout extends StatefulWidget {
  const StudentLayout({super.key});

  @override
  State<StudentLayout> createState() => _StudentLayoutState();
}

class _StudentLayoutState extends State<StudentLayout> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const SubjectPage(),
    const TimetablePage(),
    const AttendancePage(),
    const ClassesPage(),
    const ResultsPage(),
    const ProfilePage(),
  ];

  final List<String> _titles = [
    "Dashboard",
    "Subject",
    "Timetable",
    "Attendance",
    "Classes",
    "Results",
    "Profile",
  ];

  final List<IconData> _icons = [
    Icons.dashboard,
    Icons.book,
    Icons.schedule,
    Icons.check_circle,
    Icons.class_,
    Icons.grade,
    Icons.person,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context); // close drawer on tap
    });
  }

  @override
  Widget build(BuildContext context) {
    final greenColor = Colors.green;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: greenColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: greenColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Text(
                      "S",
                      style: TextStyle(
                        color: greenColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Student Panel",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  for (int index = 0; index < _titles.length; index++)
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _selectedIndex == index
                            ? greenColor.withOpacity(0.1)
                            : null,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: Icon(
                          _icons[index],
                          color: _selectedIndex == index
                              ? greenColor
                              : Colors.grey[800],
                        ),
                        title: Text(
                          _titles[index],
                          style: TextStyle(
                            fontWeight: _selectedIndex == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: _selectedIndex == index
                                ? greenColor
                                : Colors.grey[800],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onTap: () => _onItemTapped(index),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: const Size.fromHeight(40),
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/home',
                    (route) => false,
                  );
                },
                child: const Text(
                  "Exit",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
