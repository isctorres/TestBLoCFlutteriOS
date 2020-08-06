import 'package:flutter/material.dart';
import 'package:test_bloc/src/dashboard_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Empleado BLoC',
      theme: ThemeData(
        primaryColor: Colors.green
      ),
      home: DashboardScreen()
    );
  }
}