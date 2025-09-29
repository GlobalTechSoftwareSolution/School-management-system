import 'package:flutter/material.dart';
import '../services/db_service.dart';

class UserProvider with ChangeNotifier {
  final DBService _dbService = DBService();

  // Store all users or filtered by role
  List<Map<String, dynamic>> _students = [];
  List<Map<String, dynamic>> _teachers = [];
  Map<String, dynamic>? _admin;

  // Getters
  List<Map<String, dynamic>> get students => _students;
  List<Map<String, dynamic>> get teachers => _teachers;
  Map<String, dynamic>? get admin => _admin;

  // Fetch all students from Supabase
  Future<void> fetchStudents() async {
    _students = await _dbService.getStudents();
    notifyListeners();
  }

  // Fetch all teachers from Supabase
  Future<void> fetchTeachers() async {
    _teachers = await _dbService.getTeachers();
    notifyListeners();
  }

  // Fetch admin info (assuming only 1 admin)
  Future<void> fetchAdmin() async {
    final admins = await _dbService.getAdmin();
    _admin = admins.isNotEmpty ? admins.first : null;
    notifyListeners();
  }

  // Add, update, delete functions
  Future<void> addStudent(Map<String, dynamic> studentData) async {
    await _dbService.addStudent(studentData);
    await fetchStudents(); // Refresh
  }

  Future<void> updateStudent(int id, Map<String, dynamic> studentData) async {
    await _dbService.updateStudent(id, studentData);
    await fetchStudents();
  }

  Future<void> deleteStudent(int id) async {
    await _dbService.deleteStudent(id);
    await fetchStudents();
  }
}
