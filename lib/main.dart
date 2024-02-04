import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tanle/Intro_page.dart';
import 'firebase_options.dart';
import 'nav_pages/data_insert.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyInsertPages(),
    );
  }
}