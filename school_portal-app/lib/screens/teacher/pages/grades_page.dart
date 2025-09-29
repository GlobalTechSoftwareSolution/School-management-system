import 'package:flutter/material.dart';

class GradesPage extends StatelessWidget {
  const GradesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Grades")),
      body: const Center(
        child: Text(
          "Welcome to the Grades Page",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
