import 'package:countapp/apis/ApiService.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:countapp/models/RecordData.dart';

class MyLineChart extends StatelessWidget {
  final List<MyRecord> data;

  const MyLineChart(this.data, {Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    // Calculate averages or use original data as needed
     
      late List<MyRecord> realRecords = [];
  late List<RecordData> recordList = [];

realRecords = data;
        // Limit to first 10 records
        recordList = realRecords.take(10).map((record) {
          return RecordData(
            record.timestamp, // Format date to string
            record.inCount,
            record.outCount,
          );
        }).toList();
        List<double> inCounts = recordList.map((record) => record.inCount.toDouble()).toList();
     List<double> outCounts = recordList.map((record) => record.otherCount.toDouble()).toList();
     List<String> timeLabels = recordList.map((record) => _formatTime(record.timestamp)).toList();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  int index = value.toInt();
                  return Text(timeLabels[index]);
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d), width: 1),
          ),
          minX: 0,
          maxX: inCounts.length.toDouble() - 1,
          minY: 0,
          maxY: (inCounts.reduce((a, b) => a > b ? a : b) * 1.2), // Add some padding to the max y value
          lineBarsData: [
            LineChartBarData(
              spots: inCounts.asMap().entries.map((entry) {
                int index = entry.key;
                return FlSpot(index.toDouble(), entry.value);
              }).toList(),
              isCurved: true,
              color:Colors.red,
              barWidth: 4,
              belowBarData: BarAreaData(show: false),
            ),
            LineChartBarData(
              spots: outCounts.asMap().entries.map((entry) {
                int index = entry.key;
                return FlSpot(index.toDouble(), entry.value);
              }).toList(),
              isCurved: true,
              color: Colors.pink,
              barWidth: 4,
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime timestamp) {
    return "${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}";
  }
}
