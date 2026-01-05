import 'package:cloud_firestore/cloud_firestore.dart';
import 'work_break.dart';

class WorkSession {
  DateTime start;
  DateTime? end;
  List<WorkBreak> breaks;
  // Når vi opretter en ny start, skal den altid have et start-tidspunkt.
  // (end) kan være null, hvilket betyder, at jobbet endnu ikke er afsluttet.
  WorkSession({required this.start, this.end, List<WorkBreak>? breaks})
    : breaks = breaks ?? [];

  factory WorkSession.fromJson(Map<String, dynamic> json) => WorkSession(
    start: (json['start'] as Timestamp).toDate(),
    end: json['end'] != null ? (json['end'] as Timestamp).toDate() : null,
    breaks: (json['breaks'] as List<dynamic>? ?? [])
        .map((b) => WorkBreak.fromJson(b))
        .toList(),
  );

  Duration get totalWorked {
    if (end == null) return Duration.zero;
    Duration work = end!.difference(start);
    for (final b in breaks) {
      if (b.end != null) work -= b.end!.difference(b.start);
    }
    return work;
  }

  Map<String, dynamic> toJson() => {
    'start': Timestamp.fromDate(start),
    'end': end != null ? Timestamp.fromDate(end!) : null,
    'breaks': breaks.map((b) => b.toJson()).toList(),
  };
}
