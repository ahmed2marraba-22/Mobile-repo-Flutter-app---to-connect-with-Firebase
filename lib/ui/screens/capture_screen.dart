import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';
import '../../features/gnss/simulated_gnss_provider.dart';

class CaptureScreen extends StatefulWidget {
  const CaptureScreen({super.key});

  @override
  State<CaptureScreen> createState() => _CaptureScreenState();
}

class _CaptureScreenState extends State<CaptureScreen> {
  final _notes = TextEditingController();
  final _gnss = SimulatedGnssProvider();
  String? _missionId;
  bool _busy = false;

  Future<void> _save() async {
    final state = context.read<AppState>();
    if (_missionId == null) return;
    setState(() => _busy = true);
    final observation = await _gnss.currentObservation();
    await state.saveCapture(
      missionId: _missionId!,
      answers: {
        'notes': _notes.text.trim(),
        'fixType': observation.fixType.name,
        'satellites': observation.satellites,
        'pdop': double.parse(observation.pdop.toStringAsFixed(2)),
      },
      latitude: double.parse(observation.latitude.toStringAsFixed(6)),
      longitude: double.parse(observation.longitude.toStringAsFixed(6)),
      accuracy: double.parse(observation.horizontalAccuracy.toStringAsFixed(2)),
    );
    if (!mounted) return;
    setState(() => _busy = false);
    _notes.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم حفظ التسجيل محلياً وبانتظار المزامنة')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final missions = state.missions;
    if (missions.isNotEmpty && _missionId == null) {
      _missionId = missions.first['id']?.toString();
    }
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (missions.isEmpty)
          const Card(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Center(child: Text('أنشئ مهمة أولاً من شاشة المهمات')),
            ),
          )
        else ...[
          DropdownButtonFormField<String>(
            initialValue: _missionId,
            decoration: const InputDecoration(labelText: 'المهمة'),
            items: [
              for (final m in missions)
                DropdownMenuItem(
                  value: m['id']?.toString(),
                  child: Text(m['name']?.toString() ?? m['id'].toString()),
                ),
            ],
            onChanged: (v) => setState(() => _missionId = v),
          ),
          const SizedBox(height: 16),
          Card(
            child: StreamBuilder(
              stream: _gnss.observations().take(1),
              builder: (context, snap) {
                final obs = snap.data;
                return ListTile(
                  leading: Icon(
                    obs == null
                        ? Icons.gps_off
                        : obs.horizontalAccuracy < 1.5
                            ? Icons.gps_fixed
                            : Icons.gps_not_fixed,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: Text(obs == null ? 'جاري قراءة الأقمار…' : 'GNSS (محاكاة)'),
                  subtitle: obs == null
                      ? null
                      : Text(
                          'دقة ${obs.horizontalAccuracy.toStringAsFixed(1)} م · '
                          'أقمار ${obs.satellites} · ${obs.fixType.name}\n'
                          '${obs.latitude.toStringAsFixed(5)}, ${obs.longitude.toStringAsFixed(5)}',
                        ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _notes,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'ملاحظات الميدان',
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: _busy ? null : _save,
            icon: const Icon(Icons.save_outlined),
            label: Text(_busy ? 'جاري الحفظ…' : 'حفظ التسجيل'),
          ),
        ],
      ],
    );
  }
}
