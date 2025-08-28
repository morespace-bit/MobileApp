import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter/core/theme/theme.dart';
import 'package:learn_flutter/features/auth/view/signup_page.dart';
import 'package:learn_flutter/features/auth/viewmodel/auth_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();
  final authNotifier = container.read(authViewmodelProvider.notifier);

  final authToken = await authNotifier.verify();
  print("Verified token: $authToken");

  runApp(
    ProviderScope(
      parent: container, // preserves the notifier state
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      home: SignupPage(),
    );
  }
}
