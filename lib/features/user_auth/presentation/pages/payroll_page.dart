// payroll_page.dart

import 'package:flutter/material.dart';

class PayrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payroll'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          'View payroll details here.',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
