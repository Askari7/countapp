import 'package:countapp/apis/ApiService.dart';
import 'package:countapp/components/BarChart.dart';
import 'package:countapp/components/MyLineChart.dart';
import 'package:flutter/material.dart';

class RecordsScreen extends StatelessWidget {
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

          return SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 4,
                        color: Color(0xFFe0444c), // Customize card color
                        margin: EdgeInsets.all(16),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Total Count For Today: ${lastRecord.inCount}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // Customize text color
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 4,
                        color: Color(0xFFe0444c), // Customize card color
                        margin: EdgeInsets.all(16),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Total Previous Day Count: ${lastRecord.outCount}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // Customize text color
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 4,
                        color: Color(0xFFe0444c), // Customize card color
                        margin: EdgeInsets.all(16),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Max Count For Today: ${lastRecord.outCount}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // Customize text color
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                          child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.circular(20)),
                                        width: MediaQuery.of(context).size.width / 3,
                                        height: 350,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: MyBarchart(records),
                                        )),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                                    child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(20)),
                                    width: MediaQuery.of(context).size.width / 3,
                                    height: 350,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MyLineChart(records),
                                    )),
                                  ),
                      ),
                    ],
                  ),
                                
                ],
            
              ),
            
            ),
          );
        },
      ),
    );
  }
}
