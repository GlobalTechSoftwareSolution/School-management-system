import 'package:flutter/material.dart';

class ParentsPage extends StatelessWidget {
  const ParentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Parents Page")),
      body: const Center(
        child: Text(
          "Welcome to the Parents Page",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
