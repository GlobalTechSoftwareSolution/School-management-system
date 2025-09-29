import 'package:flutter/material.dart';

import '../../routes.dart';
import '../student/student_layout.dart';
import '../teacher/teacher_layout.dart';
import '../admin/admin_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isSmallScreen = constraints.maxWidth < 700;
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: isSmallScreen ? 32 : 56,
                  horizontal: isSmallScreen ? 8 : 32,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Centered logo
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 16,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "assets/Global.webp",
                        height: isSmallScreen ? 80 : 100,
                        width: isSmallScreen ? 80 : 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "Welcome to Smart School",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "School Management System",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.teal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 36),
                    isSmallScreen
                        ? Column(
                            children: [
                              _SimpleOptionCard(
                                icon: Icons.person,
                                label: "Student",
                                description:
                                    "Access your courses, grades, and schedule.",
                                onTap: () =>
                                    Navigator.pushNamed(context, '/student'),
                              ),
                              const SizedBox(height: 20),
                              _SimpleOptionCard(
                                icon: Icons.school,
                                label: "Teacher",
                                description:
                                    "Manage classes, assignments, and attendance.",
                                onTap: () =>
                                    Navigator.pushNamed(context, '/teacher'),
                              ),
                              const SizedBox(height: 20),
                              _SimpleOptionCard(
                                icon: Icons.admin_panel_settings,
                                label: "Admin",
                                description:
                                    "Oversee school operations and user management.",
                                onTap: () =>
                                    Navigator.pushNamed(context, '/admin'),
                              ),
                            ],
                          )
                        : Wrap(
                            spacing: 24,
                            runSpacing: 24,
                            alignment: WrapAlignment.center,
                            children: [
                              SizedBox(
                                width: 260,
                                child: _SimpleOptionCard(
                                  icon: Icons.person,
                                  label: "Student",
                                  description:
                                      "Access your courses, grades, and schedule.",
                                  onTap: () =>
                                      Navigator.pushNamed(context, '/student'),
                                ),
                              ),
                              SizedBox(
                                width: 260,
                                child: _SimpleOptionCard(
                                  icon: Icons.school,
                                  label: "Teacher",
                                  description:
                                      "Manage classes, assignments, and attendance.",
                                  onTap: () =>
                                      Navigator.pushNamed(context, '/teacher'),
                                ),
                              ),
                              SizedBox(
                                width: 260,
                                child: _SimpleOptionCard(
                                  icon: Icons.admin_panel_settings,
                                  label: "Admin",
                                  description:
                                      "Oversee school operations and user management.",
                                  onTap: () =>
                                      Navigator.pushNamed(context, '/admin'),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SimpleOptionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String description;
  final VoidCallback onTap;

  const _SimpleOptionCard({
    required this.icon,
    required this.label,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 44, color: Colors.blue),
              const SizedBox(height: 14),
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
