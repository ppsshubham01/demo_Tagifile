import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:tagifiles/provider/auth_provider.dart';
import 'package:tagifiles/screens/verification/email_pending.dart';
import 'package:tagifiles/screens/verification/email_verify.dart';
import 'package:tagifiles/screens/verification/two_factor_auth.dart';
import 'package:tagifiles/screens/welcome_screen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding)
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();

  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
//  Load reaources
  await Future.delayed(const Duration(seconds: 1));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider())
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: WelcomeScreen()
          // home: EmailPending(),
          ),
    );
  }
}
