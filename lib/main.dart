
import 'dart:async';
import 'dart:developer' as developer;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:tagifiles/loading_screen.dart';
import 'package:tagifiles/provider/auth_provider.dart';
import 'package:tagifiles/provider/createFolder_provider.dart';
import 'package:tagifiles/screens/auth/welcome_screen.dart';
import 'package:tagifiles/screens/home/home_screen.dart';
import 'package:tagifiles/screens/verification/email_pending.dart';
import 'package:tagifiles/screens/verification/email_verify.dart';
import 'package:tagifiles/screens/verification/two_factor_auth.dart';
import 'package:tagifiles/services/service.dart';
import 'package:tagifiles/util/dialog_box.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding)
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();
  // String? tokenKey = await ApiService().getTokenFromPrefs();

  runApp(MyApp());
}

Future initialization(BuildContext? context) async {
//  Load reasources
  await Future.delayed(const Duration(seconds: 1));
}

class MyApp extends StatefulWidget {
  // String? tokenKey;

  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    // TODO: implement initState
    initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.initState();
  }



  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      // print("Couldn\'t check connectivity status: $e");
      return;
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  showConnectivityStatus(BuildContext context) {
    if(_connectionStatus == ConnectivityResult.none){
      print("you are offline");
      // await PopDialog().showMyDialog(context);
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('data'),));
    } else if(_connectionStatus == ConnectivityResult.mobile || _connectionStatus == ConnectivityResult.wifi)
    {
      print("you are online");
    }
  }

  @override
  Widget build(BuildContext context) {
    showConnectivityStatus(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AuthProvider()),
        ChangeNotifierProvider.value(value: ApiService()),
        ChangeNotifierProvider.value(value: CreateFolderProvider()),
      ],
      child: Consumer<ApiService>(
        builder: (context, apiServiceInstanceProvider, child) =>
            MaterialApp(
                debugShowCheckedModeBanner: false,
                // theme: ThemeData(fontFamily: 'Helvetica'),
                home: apiServiceInstanceProvider.isToken
                    ? const HomePage()
                    : FutureBuilder(
                  future: apiServiceInstanceProvider.tryAutoLogin(),
                  builder: (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? LoadingScreen()
                      : WelcomeScreen(),
                )
              // const WelcomeScreen(),
            ),
      ),
    );
  }
}

// -->     home: tokenKey != null || apiServiceInstanceProvider.tokenKey != null ? const HomePage() : const WelcomeScreen()
// --> home: tokenKey == null || apiServiceInstanceProvider.tokenKey == null ? const WelcomeScreen() : const HomePage()
