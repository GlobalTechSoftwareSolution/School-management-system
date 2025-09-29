import 'package:flutter/material.dart';

class TeacherLayout extends StatefulWidget {
  const TeacherLayout({super.key});

  @override
  State<TeacherLayout> createState() => _TeacherLayoutState();
}

class _TeacherLayoutState extends State<TeacherLayout> {
  int _selectedIndex = 0;

  final List<String> _pages = [
    "Dashboard",
    "Timetable",
    "Classes",
    "Attendance",
    "Grades",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teacher Panel"),
        backgroundColor: Colors.green[700],
      ),
      body: Center(
        child: Text(
          "Welcome to ${_pages[_selectedIndex]} Page",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green[200]),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                    child: Text(
                      "T",
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    "Teacher Panel",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.dashboard),
                    title: const Text("Dashboard"),
                    selected: _selectedIndex == 0,
                    onTap: () => _onItemTapped(0),
                  ),
                  ListTile(
                    leading: const Icon(Icons.access_time),
                    title: const Text("Timetable"),
                    selected: _selectedIndex == 1,
                    onTap: () => _onItemTapped(1),
                  ),
                  ListTile(
                    leading: const Icon(Icons.class_),
                    title: const Text("Classes"),
                    selected: _selectedIndex == 2,
                    onTap: () => _onItemTapped(2),
                  ),
                  ListTile(
                    leading: const Icon(Icons.check_circle),
                    title: const Text("Attendance"),
                    selected: _selectedIndex == 3,
                    onTap: () => _onItemTapped(3),
                  ),
                  ListTile(
                    leading: const Icon(Icons.grade),
                    title: const Text("Grades"),
                    selected: _selectedIndex == 4,
                    onTap: () => _onItemTapped(4),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text("Exit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
