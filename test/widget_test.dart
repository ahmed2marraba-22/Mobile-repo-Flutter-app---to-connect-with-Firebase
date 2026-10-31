import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:geoflow_field/ui/theme.dart';

void main() {
  testWidgets('GeoFlow theme builds Material 3 light theme', (WidgetTester tester) async {
    final theme = GeoTheme.light();
    expect(theme.useMaterial3, isTrue);
    expect(theme.colorScheme.brightness, Brightness.light);

    await tester.pumpWidget(MaterialApp(theme: theme, home: const SizedBox()));
    expect(tester.takeException(), isNull);
  });
}
