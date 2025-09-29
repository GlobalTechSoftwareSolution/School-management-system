import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TestBackendScreen extends StatelessWidget {
  const TestBackendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;

    return Scaffold(
      appBar: AppBar(title: const Text('Supabase Test')),
      body: FutureBuilder(
        future: supabase.from('students').select(), // no execute()
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final response = snapshot.data;
          if (response == null || (response as List).isEmpty) {
            return const Center(child: Text('No students found.'));
          }

          final data = response as List<dynamic>;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, i) => ListTile(
              title: Text(data[i]['name'] ?? ''),
              subtitle: Text(data[i]['roll'] ?? ''),
            ),
          );
        },
      ),
    );
  }
}
