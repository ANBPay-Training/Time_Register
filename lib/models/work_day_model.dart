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
      // beregner den aktuelle pausetid via forskellen mellem pausestart og nu
      // og lægger den til totalBreak
      totalBreak += DateTime.now().difference(breakStart!);
      breakStart = null;
    }
  }

  // Konverterer en Duration til en læsbar streng i formatet timer:minutter
  // for eks: "2:05
  String format(Duration d) {
    // toString().padLeft(2, '0') → hvis minutterne er ensifrede,
    // fyldes de med et nul foran så det bliver to sifre. format -->  7:30
    return "${d.inHours}:${(d.inMinutes % 60).toString().padLeft(2, '0')}";
  }

  String get workedTime {
    // Hvis start- eller sluttidspunkt ikke findes → returnerer '0:00
    if (startWork == null || endWork == null) return "0:00";
    // Beregner den faktiske arbejdstid uden pauser
    final total = endWork!.difference(startWork!) - totalBreak;
    return format(total);
  }

  // Konverterer den samlede pausetid til en streng -> for eks. "0:45"
  String get totalBreakFormatted => format(totalBreak);
}
