enum FieldLifecycleStatus { captured, synced, qcPending, qcRejected, qcApproved, published }

class FieldEvidenceRef {
  final String id;
  final String kind;
  final String? sha256;
  const FieldEvidenceRef({required this.id, required this.kind, this.sha256});
}

class FieldDataPackage {
  final String missionId;
  final String surveyId;
  final String formDraftId;
  final double latitude;
  final double longitude;
  final Map<String, dynamic>? gnss;
  final List<Map<String, dynamic>> annotations;
  final List<FieldEvidenceRef> evidence;
  final String? trackId;

  const FieldDataPackage({required this.missionId, required this.surveyId, required this.formDraftId,
    required this.latitude, required this.longitude, this.gnss,
    this.annotations = const [], this.evidence = const [], this.trackId});
}

/// Orchestrates references to field data; it never owns HTTP, retry, cursor or conflict transport.
abstract interface class FieldDataLifecycleRepository {
  Future<void> save(FieldDataPackage package);
  Future<void> createSyncIntent(FieldDataPackage package);
}
