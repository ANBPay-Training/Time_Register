import 'package:time_register_flutter/models/work_session.dart';

class WorkDayModel {
  final List<WorkSession> sessions;

  WorkDayModel({List<WorkSession>? sessions}) : sessions = sessions ?? [];
  // looper in i hver session og lægger sammen tiden
  // ligesom den kode: total += s.totalWorked;
  Duration get totalWorkedToday =>
      sessions.fold(Duration.zero, (t, s) => t + s.totalWorked);

  Duration get totalBreakToday {
    Duration total = Duration.zero;
    for (final s in sessions) {
      for (final b in s.breaks) {
        if (b.end != null) total += b.end!.difference(b.start);
      }
    }
    return total;
  }

  Map<String, dynamic> toJson() => {
    'sessions': sessions.map((s) => s.toJson()).toList(),
  };

  factory WorkDayModel.fromJson(Map<String, dynamic> json) => WorkDayModel(
    sessions: (json['sessions'] as List<dynamic>? ?? [])
        .map((s) => WorkSession.fromJson(s))
        .toList(),
  );
}
