import 'package:supabase_flutter/supabase_flutter.dart';

class DBService {
  final _supabase = Supabase.instance.client;

  // Get students
  Future<List<Map<String, dynamic>>> getStudents() async {
    final response = await _supabase.from('students').select().execute();
    return response.data;
  }

  // Add student
  Future<void> addStudent(Map<String, dynamic> studentData) async {
    await _supabase.from('students').insert(studentData).execute();
  }

  // Update student
  Future<void> updateStudent(int id, Map<String, dynamic> studentData) async {
    await _supabase.from('students').update(studentData).eq('id', id).execute();
  }

  // Delete student
  Future<void> deleteStudent(int id) async {
    await _supabase.from('students').delete().eq('id', id).execute();
  }
}
