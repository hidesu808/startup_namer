import 'package:flutter/material.dart';
import 'package:startup_namer/randomWords.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to flutter',

      home: RandomWords(),
      );
  }
}