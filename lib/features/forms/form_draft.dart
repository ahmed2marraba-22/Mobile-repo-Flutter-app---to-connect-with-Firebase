class FormDraft {
  final String captureId;
  final String formId;
  final int formVersion;
  final Map<String, dynamic> answers;
  const FormDraft({required this.captureId, required this.formId, required this.formVersion, this.answers = const {}});
}
