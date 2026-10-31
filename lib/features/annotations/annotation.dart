enum AnnotationType { point, line, polygon, measurement, defect, observation, evidence }

class GisAnnotation {
  final String id;
  final AnnotationType type;
  final String? attachmentId;
  const GisAnnotation({required this.id, required this.type, this.attachmentId});
}
