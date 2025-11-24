class WorkDayModel {
  DateTime? startWork;
  DateTime? endWork;

  DateTime? breakStart;
  Duration totalBreak = Duration.zero;

  bool get isWorking => startWork != null && endWork == null;
  bool get onBreak => breakStart != null;

  void startWorkNow() {
    startWork = DateTime.now();
    endWork = null;
    totalBreak = Duration.zero; // 0:00:00
    breakStart = null;
  }

  void endWorkNow() {
    if (breakStart != null) {
      totalBreak += DateTime.now().difference(breakStart!);
      breakStart = null;
    }
    endWork = DateTime.now();
  }

  void startBreak() {
    breakStart = DateTime.now();
  }

  void endBreak() {
    if (breakStart != null) {
      // Udråbstegnet (!) siger at breakStart har en værdi og ikke er null
      totalBreak += DateTime.now().difference(breakStart!);
      breakStart = null;
    }
  }

  // Konverterer en Duration til en læsbar streng i formatet timer:minutter
  String formatDur(Duration d) {
    // to sifre. format -->  7:05
    return "${d.inHours}:${(d.inMinutes % 60).toString().padLeft(2, '0')}";
  }

  String get totalWorkedFormatted {
    if (startWork == null || endWork == null) return "0:00";
    final totalWorked = endWork!.difference(startWork!) - totalBreak;
    return formatDur(totalWorked);
  }

  String get totalBreakFormatted => formatDur(totalBreak);
}
