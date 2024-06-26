import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GradesPage extends StatefulWidget {
  final String studentId;

  GradesPage({Key? key, required this.studentId}) : super(key: key);

  @override
  _GradesPageState createState() => _GradesPageState();
}

class _GradesPageState extends State<GradesPage> {
  List<Map<String, dynamic>> grades = [];

  @override
  void initState() {
    super.initState();
    if (widget.studentId.isNotEmpty) {
      fetchData(); // Call function to fetch data when widget initializes if studentId is not empty
    }
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.1.19:3002/api/grades?student_id=${widget.studentId}'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        setState(() {
          grades = data.map((entry) => {
            'subject': entry['Subject'] ?? '', // Safeguard against null values
            'grade': entry['Grade'] ?? '',
          }).toList();
        });
      } else {
        // Handle HTTP error status codes
        print('Failed to load grades: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or JSON decoding errors
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grades'),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columns: [
              DataColumn(label: Text('Subject')),
              DataColumn(label: Text('Grade')),
            ],
            rows: grades.map((grade) => DataRow(
              cells: [
                DataCell(Text(grade['subject'])),
                DataCell(Text(grade['grade'].toString())),
              ],
            )).toList(),
          ),
        ),
      ),
    );
  }
}
