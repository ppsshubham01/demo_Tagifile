import 'dart:async';
import 'dart:developer' as developer;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:tagifiles/loading_screen.dart';
import 'package:tagifiles/model/chatUsersModel.dart';
import 'package:tagifiles/provider/auth_provider.dart';
import 'package:tagifiles/screens/auth/welcome_screen.dart';
import 'package:tagifiles/screens/chats/userProfile/singleUserProfile.dart';
import 'package:tagifiles/screens/home/home_screen.dart';
import 'package:tagifiles/services/service.dart';
import 'package:tagifiles/util/local_notification.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding)
  LocalNotificationService.initialize();

  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();

  // String? tokenKey = await ApiService().getTokenFromPrefs();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  // String? tokenKey;

  const MyApp({super.key});

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
      // if(result == ConnectivityResult.none){
      //   print("you are offline...");
      //   showNetworkErrorPopup();
      // }
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

  void showNetworkErrorPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("No Internet Connection"),
          content: const Text("Please check your internet connection."),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  // showConnectivityStatus(BuildContext context) {
  //   if(_connectionStatus == ConnectivityResult.none){
  //     print("you are offline");
  //     // await PopDialog().showMyDialog(context);
  //     // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('data'),));
  //   } else if(_connectionStatus == ConnectivityResult.mobile || _connectionStatus == ConnectivityResult.wifi)
  //   {
  //     print("you are online");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // showConnectivityStatus(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AuthProvider()),
        ChangeNotifierProvider.value(value: ApiService()),
        // ChangeNotifierProvider.value(value: CreateFolderProvider()),
      ],
      child: Builder(
        builder: (context) {
          return Consumer<ApiService>(
            builder: (context, apiServiceInstanceProvider, child) =>
                MaterialApp(
                    debugShowCheckedModeBanner: false,
                    // theme: ThemeData(fontFamily: 'Helvetica'),

                    // routerConfig:  GoRouter(routes: [
                    //   GoRoute(
                    //       path: "/",
                    //     // builder: (context, state) => apiServiceInstanceProvider.isToken
                    //     builder: (_,  __) => apiServiceInstanceProvider.isToken
                    //         ? const HomePage()
                    //         : FutureBuilder(
                    //       future: apiServiceInstanceProvider. tryAutoLogin(),
                    //       builder: (context, snapshot) =>
                    //       snapshot.connectionState == ConnectionState.waiting
                    //           ? const LoadingScreen()
                    //           : const WelcomeScreen(),
                    //     )
                    //   ),
                    // ]),

                    home: apiServiceInstanceProvider.isToken
                        ? const HomePage()
                        : FutureBuilder(
                      future: apiServiceInstanceProvider.tryAutoLogin(),
                      builder: (context, snapshot) =>
                      snapshot.connectionState == ConnectionState.waiting
                          ? const LoadingScreen()
                          : const WelcomeScreen(),
                    )
                  // home: SingleUserProfile(userItem:{}, userNetworkImage: ''),
                  // const WelcomeScreen(),
                ),
          );
        }
      ),
    );
  }
}

// -->     home: tokenKey != null || apiServiceInstanceProvider.tokenKey != null ? const HomePage() : const WelcomeScreen()
// --> home: tokenKey == null || apiServiceInstanceProvider.tokenKey == null ? const WelcomeScreen() : const HomePage()
