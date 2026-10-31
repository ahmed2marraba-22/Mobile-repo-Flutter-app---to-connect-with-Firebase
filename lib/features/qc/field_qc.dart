class FieldQcFinding {
  final String id;
  final String severity;
  final String message;
  final bool blocking;
  const FieldQcFinding({required this.id, required this.severity, required this.message, required this.blocking});
}

class FieldQcReport {
  final List<FieldQcFinding> findings;
  const FieldQcReport(this.findings);
  bool get canSubmit => findings.every((f) => !f.blocking);
}
