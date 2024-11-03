import 'package:countapp/apis/ApiService.dart';
import 'package:countapp/components/TableComponent.dart';
import 'package:flutter/material.dart';

class UserManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        title: Center(child: Image.asset("assets/ayat.png",width: MediaQuery.of(context).size.width*0.5,)),
        backgroundColor: Color(0xFF403c7c) // Customize the color
      ),
      body: FutureBuilder<List<MyRecord>>(
        future: fetchRecords(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No records found.'));
          }

          // Display the last record in a colorful box
          final records = snapshot.data!;
          final lastRecord = records.last;

          return Container(
            child: Column(
              children: [
                Tablescreen(
        userDataList: [
          UserData(
            fullName: 'John Doe',
            email: 'john.doe@example.com',
            lastLogin: '2024-09-21 10:00 AM',
          ),
          UserData(
            fullName: 'Jane Smith',
            email: 'jane.smith@example.com',
            lastLogin: '2024-09-20 08:30 AM',
          ),
          UserData(
            fullName: 'Michael Brown',
            email: 'michael.brown@example.com',
            lastLogin: '2024-09-19 12:45 PM',
          ),
          // Add more user data as needed
        ],
      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
