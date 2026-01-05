import 'package:cloud_firestore/cloud_firestore.dart';

class WorkBreak {
  DateTime start;
  DateTime? end;

  WorkBreak({required this.start, this.end});

  Map<String, dynamic> toJson() => {
    'start': Timestamp.fromDate(start),
    'end': end != null ? Timestamp.fromDate(end!) : null,
  };

  factory WorkBreak.fromJson(Map<String, dynamic> json) {
    return WorkBreak(
      start: (json['start'] as Timestamp).toDate(),
      end: json['end'] != null ? (json['end'] as Timestamp).toDate() : null,
    );
  }
}
