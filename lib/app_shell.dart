import 'core/auth/auth_session.dart';
import 'features/offline/offline_readiness.dart';

class FieldAppShell {
  final AuthRepository auth;
  AuthSession? session;
  OfflineReadinessReport readiness = const OfflineReadinessReport(
    status: OfflineReadiness.unknown,
    mapAvailable: false,
    formAvailable: false,
    storageHealthy: false,
    authCached: false,
  );

  FieldAppShell(this.auth);

  Future<void> restore() async {
    session = await auth.restore();
  }
}
