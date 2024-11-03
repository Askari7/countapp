class RecordData {
  final DateTime timestamp; // Represents the timestamp as a string
  final int inCount;      // Represents the incoming count
  final int otherCount;   // Represents another count (you can name it as per your requirement)

  RecordData(this.timestamp, this.inCount, this.otherCount);

  // Optionally, you can implement a factory constructor to create an instance from a Map
  factory RecordData.fromMap(Map<String, dynamic> data) {
    return RecordData(
      data['timestamp'] as DateTime,
      data['inCount'] as int,
      data['otherCount'] as int,
    );
  }
}