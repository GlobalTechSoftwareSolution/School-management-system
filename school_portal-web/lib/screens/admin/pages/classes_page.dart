import 'package:flutter/material.dart';

class ClassesPage extends StatelessWidget {
  const ClassesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Classes Page")),
      body: const Center(
        child: Text(
          "Welcome to the Classes Page",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
