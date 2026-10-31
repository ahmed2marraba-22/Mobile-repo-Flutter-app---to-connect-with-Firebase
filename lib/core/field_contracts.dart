class SyncIntent {
  final String clientOperationId;
  final String entityType;
  final String entityId;
  final String operation;
  final int? baseVersion;
  final Map<String, dynamic> payload;
  const SyncIntent({required this.clientOperationId, required this.entityType, required this.entityId, required this.operation, this.baseVersion, this.payload = const {}});
}

abstract interface class LocalFirstFeature {
  Future<SyncIntent> saveLocallyAndCreateIntent();
}
