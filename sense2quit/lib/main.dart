import 'package:flutter/material.dart';
import 'package:sense2quit/pages/login.dart';
import 'package:sense2quit/pages/register.dart';
import 'pages/auth.dart';
import 'pages/home.dart';
import 'package:fl_chart/fl_chart.dart';
import 'pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    // initialRoute: '/login',
    home: const auth(),
    routes: {
      '/home': (context) => Home(),
      '/login': (context) => LoginPage(),
      '/register': (context) => register(),
    },
  ));
}
