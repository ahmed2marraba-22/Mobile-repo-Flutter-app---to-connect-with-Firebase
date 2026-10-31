import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';

class MissionsScreen extends StatelessWidget {
  const MissionsScreen({super.key});

  String _statusLabel(dynamic raw) {
    final s = raw?.toString() ?? '';
    switch (s) {
      case 'planned':
        return 'مخططة';
      case 'active':
        return 'نشطة';
      case 'aborted':
        return 'ملغاة';
      case 'assigned':
        return 'مسندة';
      case 'ready':
        return 'جاهزة';
      case 'inProgress':
        return 'قيد التنفيذ';
      case 'paused':
        return 'موقوفة';
      case 'submitted':
        return 'مقدّمة';
      case 'qcReview':
        return 'مراجعة جودة';
      case 'reworkRequired':
        return 'إعادة عمل';
      case 'approved':
        return 'معتمدة';
      case 'completed':
        return 'مكتملة';
      default:
        return s.isEmpty ? '—' : s;
    }
  }

  Future<void> _createDialog(BuildContext context) async {
    final state = context.read<AppState>();
    final name = TextEditingController();
    final project = TextEditingController(
      text: state.missions.isNotEmpty
          ? (state.missions.last['projectId']?.toString() ?? '')
          : '',
    );
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('مهمة جديدة'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(labelText: 'اسم المهمة'),
              autofocus: true,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: project,
              decoration: const InputDecoration(labelText: 'معرّف المشروع (projectId)'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('إلغاء'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('إنشاء'),
          ),
        ],
      ),
    );
    if (ok == true && name.text.trim().isNotEmpty) {
      await state.createMission(
        name: name.text.trim(),
        projectId: project.text.trim().isEmpty ? 'default' : project.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final readiness = state.readiness;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: state.canStartMission ? () => _createDialog(context) : null,
        icon: const Icon(Icons.add),
        label: const Text('مهمة جديدة'),
      ),
      body: RefreshIndicator(
        onRefresh: state.refreshMissions,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      readiness.canStartMission
                          ? Icons.verified_outlined
                          : Icons.warning_amber_outlined,
                      color: readiness.canStartMission
                          ? Theme.of(context).colorScheme.primary
                          : Colors.orange,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            readiness.canStartMission
                                ? 'التطبيق جاهز للعمل دون اتصال'
                                : 'التطبيق غير جاهز بعد',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          if (readiness.reason != null)
                            Text(
                              readiness.reason!,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            if (state.lastError != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  state.lastError!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
            if (state.missions.isEmpty)
              const Padding(
                padding: EdgeInsets.only(top: 48),
                child: Center(
                  child: Text('لا توجد مهمات — اسحب للأسفل للتحديث'),
                ),
              ),
            for (final m in state.missions)
              Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    child: const Icon(Icons.flag_outlined, size: 20),
                  ),
                  title: Text(m['name']?.toString() ?? m['id']?.toString() ?? 'مهمة'),
                  subtitle: Text(
                    '${m['projectId'] ?? ''} · ${_statusLabel(m['status'])}',
                  ),
                  trailing: const Icon(Icons.chevron_left),
                ),
              ),
            const SizedBox(height: 72),
          ],
        ),
      ),
    );
  }
}
