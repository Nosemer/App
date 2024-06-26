import 'package:flutter/material.dart';
import 'package:app/grades_page.dart'; // Adjust import path as per your project structure
import 'package:app/schedule_page.dart'; // Adjust import path as per your project structure
import 'login_page.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Specify the initial route to start with
      home: LoginPage(),
      routes: {
        // Define named routes for navigation
        '/home': (context) => HomePage(),
        '/grade': (context) => GradesPage(studentId: ''), // Initialize with an empty string or null-safe default
        '/schedule': (context) => SchedulePage(),
        '/login': (context) => LoginPage(), // Default route for initial landing
      },
    );
  }
}
