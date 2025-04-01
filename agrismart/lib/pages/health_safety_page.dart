// health_safety_page.dart

import 'package:flutter/material.dart';

class HealthSafetyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health & Safety'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          'Track compliance and incidents here.',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
