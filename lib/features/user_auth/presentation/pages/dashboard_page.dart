import 'package:flutter/material.dart';
import 'package:myapp/features/user_auth/presentation/pages/tasks_page.dart';
import 'package:myapp/features/user_auth/presentation/pages/payroll_page.dart';
import 'package:myapp/features/user_auth/presentation/pages/rosters_page.dart';
import 'package:myapp/features/user_auth/presentation/pages/health_safety_page.dart';
import 'package:myapp/features/user_auth/presentation/pages/job_costing_page.dart';
import 'package:myapp/components/bottom_nav.dart';
import 'package:myapp/utils/colors.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  // List of pages to display for each Bottom Navigation option.
  final List<Widget> _pages = [
    TasksPage(),
    PayrollPage(),
    RostersPage(),
    HealthSafetyPage(),
    JobCostingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground, // Light background color
      appBar: AppBar(
        title: const Text(
          'AgriSmart Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primaryGreen, // Primary green for app theme
      ),
      body: SafeArea(
        child: _pages[_currentIndex], // Display the selected page
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: _currentIndex, // Highlight current page
        onTabTapped: (index) {
          setState(() {
            _currentIndex = index; // Update index to switch pages
          });
        },
      ),
    );
  }
}
