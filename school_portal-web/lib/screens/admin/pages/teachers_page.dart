import 'package:flutter/material.dart';

class TeachersPage extends StatelessWidget {
  const TeachersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Teachers Page")),
      body: const Center(
        child: Text(
          "Welcome to the Teachers Page",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
