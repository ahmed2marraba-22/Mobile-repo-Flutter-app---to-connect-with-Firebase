enum OfflineReadiness { unknown, checking, ready, blocked }

class OfflineReadinessReport {
  final OfflineReadiness status;
  final bool mapAvailable;
  final bool formAvailable;
  final bool storageHealthy;
  final bool authCached;
  final String? reason;
  const OfflineReadinessReport({required this.status, required this.mapAvailable, required this.formAvailable, required this.storageHealthy, required this.authCached, this.reason});

  bool get canStartMission => status == OfflineReadiness.ready && mapAvailable && formAvailable && storageHealthy && authCached;
}
