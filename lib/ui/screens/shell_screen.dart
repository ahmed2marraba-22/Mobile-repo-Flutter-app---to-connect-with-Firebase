import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';
import 'capture_screen.dart';
import 'missions_screen.dart';
import 'settings_screen.dart';
import 'sync_screen.dart';

class ShellScreen extends StatefulWidget {
  const ShellScreen({super.key});

  @override
  State<ShellScreen> createState() => _ShellScreenState();
}

class _ShellScreenState extends State<ShellScreen> {
  int _index = 0;

  static const _titles = ['المهمات', 'تسجيل ميداني', 'المزامنة', 'الإعدادات'];

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final pages = const [
      MissionsScreen(),
      CaptureScreen(),
      SyncScreen(),
      SettingsScreen(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_index],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          if (state.pendingCount > 0)
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Center(
                child: Chip(
                  avatar: Icon(Icons.cloud_upload_outlined,
                      size: 16, color: Theme.of(context).colorScheme.primary),
                  label: Text('${state.pendingCount}'),
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ),
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _index,
            onDestinationSelected: (i) => setState(() => _index = i),
            labelType: NavigationRailLabelType.all,
            leading: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Icon(Icons.explore, size: 32),
            ),
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.map_outlined),
                selectedIcon: Icon(Icons.map),
                label: Text('مهمات'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.edit_note_outlined),
                selectedIcon: Icon(Icons.edit_note),
                label: Text('تسجيل'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.sync_outlined),
                selectedIcon: Icon(Icons.sync),
                label: Text('مزامنة'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: Text('إعدادات'),
              ),
            ],
          ),
          const VerticalDivider(width: 1),
          Expanded(child: pages[_index]),
        ],
      ),
    );
  }
}
