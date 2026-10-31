import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';
import 'core/storage/local_store_factory.dart';
import 'ui/screens/login_screen.dart';
import 'ui/screens/shell_screen.dart';
import 'ui/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final state = AppState();
  await state.bootstrap();
  try {
    await state.setLocalStore(await createLocalStore());
  } catch (_) {
    // Local store failure keeps app usable in read-only/degraded mode.
  }

  runApp(GeoFieldApp(state: state));
}

class GeoFieldApp extends StatelessWidget {
  final AppState state;
  const GeoFieldApp({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: state,
      child: MaterialApp(
        title: 'GeoFlow ميداني',
        debugShowCheckedModeBanner: false,
        theme: GeoTheme.light(),
        locale: const Locale('ar'),
        supportedLocales: const [Locale('ar'), Locale('en')],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: Consumer<AppState>(
          builder: (context, app, _) => app.isSignedIn ? const ShellScreen() : const LoginScreen(),
        ),
      ),
    );
  }
}
