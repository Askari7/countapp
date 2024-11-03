

// import 'package:countapp/apis/ApiService.dart';
// import 'package:countapp/models/RecordData.dart';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// class MyBarchart extends StatefulWidget {
// const MyBarchart(this.data, {super.key}); // Correct use of super.key
//   final List<MyRecord> data; // Ensure this matches your data type
//   @override
//   State<MyBarchart> createState() => _MyBarchartState();
// }

// class _MyBarchartState extends State<MyBarchart> {
//   late List<RecordData> recordList = [];
//   late List<MyRecord> realRecords = [];


//   @override
//   void initState() {
//     super.initState();
//     _loadData();
//   }

//   _loadData() async {
//     try {
//       setState(() {
//         realRecords = widget.data;
//       });
//     } catch (e) {
//       print('Error fetching data: $e');
//       setState(() {
//         recordList = _getHardcodedData();
//       });
//     }
//   }

//   // Hardcoded data
//   List<RecordData> _getHardcodedData() {
//     return [
//       RecordData("Oct. 1, 2024, 3:11 p.m.", 12, 8),
//       RecordData("Oct. 1, 2024, 3:12 p.m.", 8, 6),
//       RecordData("Oct. 1, 2024, 3:13 p.m.", 11, 4),
//       RecordData("Oct. 1, 2024, 3:14 p.m.", 3, 3),
//       RecordData("Oct. 1, 2024, 3:15 p.m.", 5, 6),
//       RecordData("Oct. 1, 2024, 3:16 p.m.", 7, 3),
//       RecordData("Oct. 1, 2024, 3:17 p.m.", 13, 8),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return recordList.isEmpty
//         ? const Center(child: CircularProgressIndicator())
//         : Column(
//             children: [
//               Expanded(
//                 child: Container(
//                   padding: const EdgeInsets.all(16.0),
//                   child: BarChart(
//                     BarChartData(
//                       barGroups: _chartGroups(),
//                       borderData: FlBorderData(
//                         border: const Border(
//                           bottom: BorderSide(),
//                           left: BorderSide(),
//                         ),
//                       ),
//                       gridData: FlGridData(show: false),
//                       titlesData: FlTitlesData(
//                         bottomTitles: AxisTitles(
//                           axisNameWidget: const Text(
//                             'Time',
//                             style: TextStyle(
//                                 fontSize: 12, fontWeight: FontWeight.bold),
//                           ),
//                           sideTitles: _bottomTitles,
//                         ),
//                         leftTitles: AxisTitles(
//                           axisNameWidget: const Text(
//                             'In-Count, Out-Count',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 fontSize: 12, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         topTitles: AxisTitles(
//                           sideTitles: SideTitles(showTitles: false)),
//                         rightTitles: AxisTitles(
//                           sideTitles: SideTitles(showTitles: false)),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     LegendItem(color: Colors.blueAccent, text: 'In Count'),
//                     SizedBox(width: 20),
//                     LegendItem(
//                         color: Colors.orangeAccent, text: 'Out Count'),
//                   ],
//                 ),
//               ),
//             ],
//           );
//   }

//   // Generate bar chart data
//   List<BarChartGroupData> _chartGroups() {
//     return recordList.asMap().entries.map((entry) {
//       int index = entry.key;
//       RecordData record = entry.value;

//       return BarChartGroupData(
//         x: index,
//         barRods: [
//           BarChartRodData(
//             toY: record.inCount.toDouble(),
//             color: Colors.blueAccent,
//             width: 16,
//             borderRadius: BorderRadius.circular(4),
//           ),
//           BarChartRodData(
//             toY: record.otherCount.toDouble(),
//             color: Colors.orangeAccent,
//             width: 16,
//             borderRadius: BorderRadius.circular(4),
//           ),
//         ],
//         barsSpace: 4,
//       );
//     }).toList();
//   }

//   // Labels for the bottom axis, displaying only the time part
//   SideTitles get _bottomTitles => SideTitles(
//         showTitles: true,
//         reservedSize: 40,
//         getTitlesWidget: (value, meta) {
//           int index = value.toInt();
//           if (index < recordList.length) {
//             // Extract and display only the time part
//             String timePart = _extractTime(recordList[index].timestamp);
//             return Padding(
//               padding: const EdgeInsets.only(top: 8.0),
//               child: Text(timePart),
//             );
//           } else {
//             return Container();
//           }
//         },
//       );

//   // Function to extract the time part from the timestamp string
//   String _extractTime(String timestamp) {
//     // Assuming the timestamp format is 'Oct. 1, 2024, 3:10 p.m.'
//     List<String> parts = timestamp.split(', ');
//     if (parts.length == 3) {
//       return parts[2]; // Returns the time part e.g., '3:10 p.m.'
//     }
//     return timestamp;
//   }
// }

// // Widget for displaying legend items
// class LegendItem extends StatelessWidget {
//   final Color color;
//   final String text;

//   const LegendItem({required this.color, required this.text, Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           width: 16,
//           height: 16,
//           color: color,
//         ),
//         const SizedBox(width: 8),
//         Text(text, style: const TextStyle(fontSize: 14)),
//       ],
//     );
//   }
// }




// // import 'package:fl_chart/fl_chart.dart';
// // import 'package:flutter/material.dart';
// // import 'package:monit_wms/apis/ApiService.dart';
// // import 'package:monit_wms/models/Model.dart'; // Assuming the Detection model is in Model.dart

// // class MyBarchart extends StatefulWidget {
// //   const MyBarchart({super.key});

// //   @override
// //   State<MyBarchart> createState() => _MyBarchartState();
// // }

// // class _MyBarchartState extends State<MyBarchart> {
// //   late List<Detection> detectionList = [];
// //   final WasteLockerApiService apiService = WasteLockerApiService();

// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadData();
// //   }

// //   _loadData() async {
// //     try {
// //       final detectionData = await apiService.fetchDetections();
      
// //       setState(() {
// //         detectionList = detectionData.map<Detection>((json) => Detection.fromJson(json)).toList();
// //       });
// //     } catch (e) {
// //       // Handle errors here
// //       print('Error fetching data: $e');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return detectionList.isEmpty
// //         ? Center(child: CircularProgressIndicator()) // Show loader while data is loading
// //         : Container(
// //             padding: const EdgeInsets.all(16.0),
// //             child: BarChart(
// //               BarChartData(
// //                 barGroups: _chartGroups(),
// //                 borderData: FlBorderData(
// //                   border: const Border(
// //                     bottom: BorderSide(),
// //                     left: BorderSide(),
// //                   ),
// //                 ),
// //                 gridData: FlGridData(show: false),
// //                 titlesData: FlTitlesData(
// //                   bottomTitles: AxisTitles(sideTitles: _bottomTitles),
// //                   leftTitles: AxisTitles(
// //                     sideTitles: SideTitles(
// //                       showTitles: true,
// //                       reservedSize: 40,
// //                       getTitlesWidget: (value, _) {
// //                         return Text(value.toInt().toString());
// //                       },
// //                     ),
// //                   ),
// //                   topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
// //                   rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
// //                 ),
// //               ),
// //             ),
// //           );
// //   }

// //   List<BarChartGroupData> _chartGroups() {
// //     // Mapping the detection data to BarChartGroupData
// //     return detectionList.asMap().entries.map((entry) {
// //       int index = entry.key;
// //       Detection detection = entry.value;

// //       return BarChartGroupData(
// //         x: index, // X-axis position (index)
// //         barRods: [
// //           BarChartRodData(
// //             toY: detection.wasteWeightInKilograms, // Y-axis value (waste weight)
// //             color: Colors.blueAccent,
// //             width: 16,
// //             borderRadius: BorderRadius.circular(8),
// //           ),
// //         ],
// //       );
// //     }).toList();
// //   }

// //   // Labels for the bottom axis
// //   SideTitles get _bottomTitles => SideTitles(
// //         showTitles: true,
// //         getTitlesWidget: (value, meta) {
// //           int index = value.toInt();
// //           if (index < detectionList.length) {
// //             // Display waste type as label
// //             return Padding(
// //               padding: const EdgeInsets.only(top: 8.0),
// //               child: Text(detectionList[index].wasteType),
// //             );
// //           } else {
// //             return Container();
// //           }
// //         },
// //       );
// // }

import 'package:countapp/apis/ApiService.dart';
import 'package:countapp/models/RecordData.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:collection';

class MyBarchart extends StatefulWidget {
  const MyBarchart(this.data, {super.key});
  final List<MyRecord> data; // Ensure this matches your data type

  @override
  State<MyBarchart> createState() => _MyBarchartState();
}

class _MyBarchartState extends State<MyBarchart> {
  late List<RecordData> recordList = [];
  late List<MyRecord> realRecords = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    try {
      setState(() {
        realRecords = widget.data;
        // Limit to first 10 records
        recordList = realRecords.take(10).map((record) {
          return RecordData(
            record.timestamp, // Format date to string
            record.inCount,
            record.outCount,
          );
        }).toList();
      });
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        recordList = _getHardcodedData();
      });
    }
  }

  // Hardcoded data
  List<RecordData> _getHardcodedData() {
    return [
    //   RecordData("Oct. 1, 2024, 3:11 p.m.", 12, 8),
    //   RecordData("Oct. 1, 2024, 3:12 p.m.", 8, 6),
    //   RecordData("Oct. 1, 2024, 3:13 p.m.", 11, 4),
    //   RecordData("Oct. 1, 2024, 3:14 p.m.", 3, 3),
    //   RecordData("Oct. 1, 2024, 3:15 p.m.", 5, 6),
    //   RecordData("Oct. 1, 2024, 3:16 p.m.", 7, 3),
    //   RecordData("Oct. 1, 2024, 3:17 p.m.", 13, 8),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return recordList.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: BarChart(
                    BarChartData(
                      barGroups: _chartGroups(),
                      borderData: FlBorderData(
                        border: const Border(
                          bottom: BorderSide(),
                          left: BorderSide(),
                        ),
                      ),
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          axisNameWidget: const Text(
                            'Hour',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          sideTitles: _bottomTitles,
                        ),
                        leftTitles: AxisTitles(
                          axisNameWidget: const Text(
                            'Average Counts',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LegendItem(color: Colors.blueAccent, text: 'In Count'),
                    SizedBox(width: 20),
                    LegendItem(color: Colors.orangeAccent, text: 'Out Count'),
                  ],
                ),
              ),
            ],
          );
  }

  // Generate bar chart data based on averages grouped by hour
  List<BarChartGroupData> _chartGroups() {
    // Grouping records by hour
    Map<int, List<RecordData>> groupedRecords = {};
    for (var record in recordList) {

      DateTime timestamp = record.timestamp; // Parse timestamp
      int hour = timestamp.hour;

      if (!groupedRecords.containsKey(hour)) {
        groupedRecords[hour] = [];
      }
      groupedRecords[hour]!.add(record);
    }

    // Calculate average counts for each hour
    List<BarChartGroupData> barGroups = [];
    groupedRecords.forEach((hour, records) {
      double inCountAvg = records.fold(0, (sum, r) => sum + r.inCount) / records.length;
      double outCountAvg = records.fold(0, (sum, r) => sum + r.otherCount) / records.length;

      barGroups.add(BarChartGroupData(
        x: hour, // Use hour as x value
        barRods: [
          BarChartRodData(
            toY: inCountAvg,
            color: Colors.blueAccent,
            width: 16,
            borderRadius: BorderRadius.circular(4),
          ),
          BarChartRodData(
            toY: outCountAvg,
            color: Colors.orangeAccent,
            width: 16,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
        barsSpace: 4,
      ));
    });

    return barGroups;
  }

  // Labels for the bottom axis, displaying only the hour
  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 40,
        getTitlesWidget: (value, meta) {
          int hour = value.toInt();
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(hour.toString()),
          );
        },
      );

  // Function to format DateTime for the hardcoded data
  String _formatDateTime(DateTime timestamp) {
    return "${timestamp.month}/${timestamp.day} ${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')} ${timestamp.hour >= 12 ? 'p.m.' : 'a.m.'}";
  }
}

// Widget for displaying legend items
class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const LegendItem({required this.color, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: color,
        ),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}


