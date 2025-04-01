// rosters_page.dart

// Page for managing work schedules and rosters.
// Displays a list of rosters with the ability to manage and edit schedules.

import 'package:flutter/material.dart';
import 'package:agrismart/components/custom_card.dart';
import 'package:agrismart/utils/colors.dart';

class RostersPage extends StatelessWidget {
  const RostersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        title: const Text('Work Rosters'),
        backgroundColor: AppColors.primaryGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Employee Rosters',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: AppColors.darkText,
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Example roster count
                itemBuilder: (context, index) {
                  return CustomCard(
                    title: 'Roster ${index + 1}',
                    description: 'Details for Roster ${index + 1}',
                    icon: Icons.schedule,
                  );
                },
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Handle roster management logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text('Edit Rosters'),
            ),
          ],
        ),
      ),
    );
  }
}
