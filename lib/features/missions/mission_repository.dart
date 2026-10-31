import '../../core/field_contracts.dart';
import '../../core/storage/local_store.dart';
import 'mission.dart';

class MissionRepository {
  final LocalStore store;
  MissionRepository(this.store);

  Future<void> save(FieldMission mission) async {
    await store.put('missions', mission.id, {
      'id': mission.id,
      'projectId': mission.projectId,
      'status': mission.status.name,
      'revision': mission.revision,
    });
  }

  Future<FieldMission?> get(String id) async {
    final value = await store.get('missions', id);
    if (value == null) return null;
    final status = MissionStatus.values.byName(value['status'] as String);
    return FieldMission(id: value['id'] as String, projectId: value['projectId'] as String, status: status, revision: value['revision'] as int);
  }

  Future<SyncIntent> saveAndCreateIntent(FieldMission mission) async {
    late SyncIntent intent;
    await store.transaction(() async {
      await save(mission);
      intent = SyncIntent(
        clientOperationId: '${mission.id}:${mission.revision}',
        entityType: 'field_mission',
        entityId: mission.id,
        operation: 'upsert',
        baseVersion: mission.revision > 0 ? mission.revision - 1 : null,
        payload: {'projectId': mission.projectId, 'status': mission.status.name, 'revision': mission.revision},
      );
    });
    return intent;
  }
}
