import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final TextEditingController _server;

  @override
  void initState() {
    super.initState();
    _server = TextEditingController(text: context.read<AppState>().serverUrl);
  }

  @override
  void dispose() {
    _server.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final readiness = state.readiness;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: Text(state.sessionDisplayName?.isNotEmpty == true
                    ? state.sessionDisplayName!
                    : (state.sessionUserId ?? 'غير مسجّل')),
                subtitle: Text(state.isSignedIn ? 'الجلسة محفوظة' : 'لا توجد جلسة'),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.phone_iphone_outlined),
                title: const Text('معرّف الجهاز'),
                subtitle: Text(state.deviceId),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('عنوان الخادم',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                TextField(
                  controller: _server,
                  decoration: const InputDecoration(hintText: 'http://127.0.0.1:3000'),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: FilledButton.tonal(
                    onPressed: () => state.setServerUrl(_server.text),
                    child: const Text('حفظ العنوان'),
                  ),
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
                leading: Icon(
                  readiness.storageHealthy ? Icons.check_circle : Icons.cancel,
                  color: readiness.storageHealthy ? Colors.green : Colors.red,
                ),
                title: const Text('التخزين المحلي'),
                trailing: Text(readiness.storageHealthy ? 'سليم' : 'غير سليم'),
              ),
              ListTile(
                leading: Icon(
                  readiness.authCached ? Icons.check_circle : Icons.cancel,
                  color: readiness.authCached ? Colors.green : Colors.orange,
                ),
                title: const Text('جلسة محفوظة'),
                trailing: Text(readiness.authCached ? 'نعم' : 'لا'),
              ),
              ListTile(
                leading: Icon(
                  readiness.mapAvailable ? Icons.check_circle : Icons.cancel,
                  color: readiness.mapAvailable ? Colors.green : Colors.orange,
                ),
                title: const Text('خريطة دون اتصال'),
                trailing: Text(readiness.mapAvailable ? 'متاحة' : 'غير متاحة'),
              ),
              ListTile(
                leading: Icon(
                  readiness.formAvailable ? Icons.check_circle : Icons.cancel,
                  color: readiness.formAvailable ? Colors.green : Colors.orange,
                ),
                title: const Text('نماذج التسجيل'),
                trailing: Text(readiness.formAvailable ? 'متاحة' : 'غير متاحة'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: state.isSignedIn
              ? () async {
                  await state.signOut();
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('تم تسجيل الخروج')),
                    );
                  }
                }
              : null,
          icon: const Icon(Icons.logout),
          label: const Text('تسجيل الخروج'),
        ),
      ],
    );
  }
}
