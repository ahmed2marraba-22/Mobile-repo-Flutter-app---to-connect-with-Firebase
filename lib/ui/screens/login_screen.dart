import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _server = TextEditingController();
  bool _showServer = false;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    final state = context.read<AppState>();
    _server.text = state.serverUrl;
  }

  Future<void> _submit() async {
    final state = context.read<AppState>();
    final username = _username.text.trim();
    final password = _password.text;
    if (username.isEmpty || password.isEmpty) return;
    setState(() => _busy = true);
    if (_showServer) await state.setServerUrl(_server.text);
    await state.signIn(username, password);
    if (!mounted) return;
    setState(() => _busy = false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = context.watch<AppState>();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(Icons.explore, size: 72, color: theme.colorScheme.primary),
                const SizedBox(height: 12),
                Text(
                  'GeoFlow ميداني',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'استوب سازوك — دخول الموظف الميداني',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.outline),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: _username,
                  decoration: const InputDecoration(
                    labelText: 'اسم المستخدم',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _password,
                  decoration: const InputDecoration(
                    labelText: 'كلمة المرور',
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                  obscureText: true,
                  onSubmitted: (_) => _submit(),
                ),
                if (_showServer) ...[
                  const SizedBox(height: 12),
                  TextField(
                    controller: _server,
                    decoration: const InputDecoration(
                      labelText: 'عنوان الخادم',
                      prefixIcon: Icon(Icons.dns_outlined),
                    ),
                  ),
                ],
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () => setState(() => _showServer = !_showServer),
                  child: Text(_showServer ? 'إخفاء إعدادات الخادم' : 'إعدادات الخادم'),
                ),
                if (state.lastError != null) ...[
                  const SizedBox(height: 8),
                  MaterialBanner(
                    content: Text(state.lastError!),
                    backgroundColor: theme.colorScheme.errorContainer,
                    actions: const [SizedBox.shrink()],
                  ),
                ],
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: _busy ? null : _submit,
                  icon: _busy
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.login),
                  label: Text(_busy ? 'جاري الدخول…' : 'تسجيل الدخول'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
