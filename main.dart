import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:istishara/login.dart';
import 'package:istishara/homePages/baseProfessionalHomepage.dart';
import 'package:istishara/homePages/baseClientHomepage.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Istishara',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:LoginPage(),
    );
  }
}
