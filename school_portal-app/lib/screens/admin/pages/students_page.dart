import 'package:flutter/material.dart';

class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Students Page")),
      body: const Center(
        child: Text(
          "Welcome to the Students Page",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
