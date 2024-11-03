import 'package:countapp/apis/ApiService.dart';
import 'package:countapp/components/BarChart.dart';
import 'package:flutter/material.dart';

class HistoricalData extends StatefulWidget {
  const HistoricalData({super.key});

  @override
  State<HistoricalData> createState() => _HistoricalDataState();
}

class _HistoricalDataState extends State<HistoricalData> {
  DateTime? _selectedDate;

  // Function to show the date picker
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
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
                 Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                             _selectedDate != null
                                 ? "Selected Date: ${_selectedDate!.toLocal()}".split(' ')[0]
                                 : "No Date Chosen",
                             style: TextStyle(fontSize: 16),
                           ),
                           SizedBox(width: 10), // Add space between text and button
                           TextButton(
                             onPressed: () => _pickDate(context),
                             style: TextButton.styleFrom(
                               backgroundColor: Colors.blue,
                               // primary: Colors.white,
                             ),
                             child: Text("Choose Date"),
                           ),
                         ],
                       ),
                 ),
                    // Container(
                    //           decoration: BoxDecoration(
                    //               color: Colors.grey[200],
                    //               borderRadius: BorderRadius.circular(20)),
                    //           width: MediaQuery.of(context).size.width / 2,
                    //           height: 350,
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(8.0),
                    //             child: MyBarchart(),
                    //           )),
              ],
            ),
          );
        },
      ),
    );
  }
}