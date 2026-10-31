import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';

class SyncScreen extends StatelessWidget {
  const SyncScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final theme = Theme.of(context);
    return RefreshIndicator(
      onRefresh: state.syncNow,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Icon(
                    state.pendingCount == 0 ? Icons.cloud_done_outlined : Icons.cloud_upload_outlined,
                    size: 56,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.pendingCount == 0
                        ? 'كل البيانات متزامنة'
                        : '${state.pendingCount} عملية بانتظار المزامنة',
                    style: theme.textTheme.titleMedium,
                  ),
                  if (state.syncMessage != null) ...[
                    const SizedBox(height: 4),
                    Text(state.syncMessage!, style: theme.textTheme.bodySmall),
                  ],
                  if (state.lastError != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      state.lastError!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: theme.colorScheme.error),
                    ),
                  ],
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: state.syncing ? null : state.syncNow,
                    icon: state.syncing
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.sync),
                    label: Text(state.syncing ? 'جاري المزامنة…' : 'مزامنة الآن'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.dns_outlined),
                  title: const Text('الخادم'),
                  trailing: Text(state.serverUrl),
                ),
                ListTile(
                  leading: const Icon(Icons.phone_iphone_outlined),
                  title: const Text('معرّف الجهاز'),
                  trailing: Text(
                    state.deviceId.length > 12
                        ? '${state.deviceId.substring(0, 12)}…'
                        : state.deviceId,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.my_location_outlined),
                  title: const Text('مؤشر السحب (cursor)'),
                  trailing: Text(state.cursor ?? '0'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
