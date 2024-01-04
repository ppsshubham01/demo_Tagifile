import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:tagifiles/provider/auth_provider.dart';
import 'package:tagifiles/screens/home_screen.dart';
import 'package:tagifiles/screens/verification/email_pending.dart';
import 'package:tagifiles/screens/verification/email_verify.dart';
import 'package:tagifiles/screens/verification/two_factor_auth.dart';
import 'package:tagifiles/screens/welcome_screen.dart';
import 'package:tagifiles/util/service.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding)
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();
  String? tokenKey = await ApiService().getTokenFromPrefs();

  runApp( MyApp(tokenKey: tokenKey,));
}

Future initialization(BuildContext? context) async {
//  Load reaources
  await Future.delayed(const Duration(seconds: 1));
}


class MyApp extends StatelessWidget {
  String? tokenKey;
   MyApp({super.key,this.tokenKey});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: tokenKey == null ?  const WelcomeScreen() : const HomePage()
          // home: EmailPending(),
          ),
    );
  }
}
