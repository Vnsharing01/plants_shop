import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:plants_shop/screens/login_screen/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: Colors.green[900],
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
