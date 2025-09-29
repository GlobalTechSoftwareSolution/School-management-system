import 'package:flutter/material.dart';

class AdminLayout extends StatefulWidget {
  const AdminLayout({super.key});

  @override
  State<AdminLayout> createState() => _AdminLayoutState();
}

class _AdminLayoutState extends State<AdminLayout> {
  int _selectedIndex = 0;

  static const List<String> _pageTitles = [
    "Dashboard",
    "Students",
    "Teachers",
    "Parents",
    "Attendance",
    "Classes",
    "Fees",
    "Approval",
    "Records",
    "Settings",
  ];

  static const List<IconData> _pageIcons = [
    Icons.dashboard,
    Icons.school,
    Icons.person,
    Icons.family_restroom,
    Icons.event_available,
    Icons.class_,
    Icons.attach_money,
    Icons.verified,
    Icons.menu_book,
    Icons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.admin_panel_settings,
                      size: 36,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "Admin Panel",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _pageTitles.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(
                      _pageIcons[index],
                      color: _selectedIndex == index ? Colors.blue : null,
                    ),
                    title: Text(
                      _pageTitles[index],
                      style: TextStyle(
                        color: _selectedIndex == index ? Colors.blue : null,
                        fontWeight: _selectedIndex == index
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    selected: _selectedIndex == index,
                    selectedTileColor: Colors.blue.withOpacity(0.08),
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.exit_to_app),
                  label: const Text("Exit"),
                  onPressed: () {
                    Navigator.pop(context); // Close drawer if open
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(_pageTitles[_selectedIndex]),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          "Welcome to ${_pageTitles[_selectedIndex]} Page",
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
