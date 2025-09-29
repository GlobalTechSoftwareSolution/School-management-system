import 'package:flutter/material.dart';

class TimetablePage extends StatelessWidget {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Timetable")),
      body: const Center(
        child: Text(
          "Welcome to the Timetable Page",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
