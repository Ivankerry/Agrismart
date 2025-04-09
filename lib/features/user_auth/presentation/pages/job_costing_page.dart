// job_costing_page.dart

// Page for calculating job costs and managing invoicing.
// Displays a list of tracked jobs with costs and allows users to create new invoices.

import 'package:flutter/material.dart';
import 'package:myapp/components/custom_card.dart';
import 'package:myapp/utils/colors.dart';

class JobCostingPage extends StatelessWidget {
  const JobCostingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        title: const Text('Job Costing'),
        backgroundColor: AppColors.primaryGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tracked Jobs',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: AppColors.darkText,
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Example job count
                itemBuilder: (context, index) {
                  return CustomCard(
                    title: 'Job ${index + 1}',
                    description: 'Cost details for Job ${index + 1}',
                    icon: Icons.attach_money,
                  );
                },
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Handle creating new invoices
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text('Create New Invoice'),
            ),
          ],
        ),
      ),
    );
  }
}
