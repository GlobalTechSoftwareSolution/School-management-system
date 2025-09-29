import 'package:flutter/material.dart';

class FeesPage extends StatelessWidget {
  const FeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fees Page")),
      body: const Center(
        child: Text("Welcome to the Fees Page", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
