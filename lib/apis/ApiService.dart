import 'dart:convert';
import 'package:http/http.dart' as http;

// Define a Record class to hold the data
class MyRecord {
  final int inCount;
  final int outCount;
  final DateTime timestamp;

  MyRecord({required this.inCount, required this.outCount, required this.timestamp});

  // Factory method to create a Record from JSON
  factory MyRecord.fromJson(Map<String, dynamic> json) {
    return MyRecord(
      inCount: json['in_count'],
      outCount: json['out_count'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}

// Function to fetch records from the API
Future<List<MyRecord>> fetchRecords() async {
  final response = await http.get(Uri.parse('http://192.168.100.156:8000/api/get-data/')); // Replace with your actual URL

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON
    final data = jsonDecode(response.body);
    final List<dynamic> recordsJson = data['records'];
    return recordsJson.map((recordJson) => MyRecord.fromJson(recordJson)).toList();
  } else {
    // If the server did not return a 200 OK response, throw an exception
    throw Exception('Failed to load records');
  }
}
