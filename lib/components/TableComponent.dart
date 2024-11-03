import 'package:flutter/material.dart';

// Define a class to represent user data
class UserData {
  final String fullName;
  final String email;
  final String lastLogin;

  UserData({
    required this.fullName,
    required this.email,
    required this.lastLogin,
  });
}

class Tablescreen extends StatefulWidget {
  // Accept a list of user data
  final List<UserData> userDataList;

  const Tablescreen({super.key, required this.userDataList});

  @override
  State<Tablescreen> createState() => _TablescreenState();
}

class _TablescreenState extends State<Tablescreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: 1000, // Adjust width as needed
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DataTable(
              dataTextStyle: TextStyle(fontSize: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              columns: const <DataColumn>[
                DataColumn(label: Text('Full Name')),
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Last Login')),
              ],
              rows: widget.userDataList.map((userData) {
                return DataRow(
                  cells: <DataCell>[
                    DataCell(Text(userData.fullName)),
                    DataCell(Text(userData.email)),
                    DataCell(Text(userData.lastLogin)),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
