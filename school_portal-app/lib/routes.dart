import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/student/student_layout.dart';
import 'screens/teacher/teacher_layout.dart';
import 'screens/admin/admin_layout.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const SplashScreen(),
  '/home': (context) => const HomePage(),
  '/studentDashboard': (context) => const StudentLayout(),
  '/teacherDashboard': (context) => const TeacherLayout(),
  '/adminDashboard': (context) => const AdminLayout(),
};
