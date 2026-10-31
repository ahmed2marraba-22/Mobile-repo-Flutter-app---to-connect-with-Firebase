enum MissionStatus { planned, assigned, ready, inProgress, paused, submitted, qcReview, reworkRequired, approved, completed }

class FieldMission {
  final String id;
  final String projectId;
  final MissionStatus status;
  final int revision;
  const FieldMission({required this.id, required this.projectId, required this.status, this.revision = 0});
}
