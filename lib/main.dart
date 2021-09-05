import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/about.dart';
import 'pages/account.dart';
import 'pages/notes.dart';
import 'pages/settings.dart';

// Точка входа
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notees app',
      theme: ThemeData(
        // *** TEXT ***
        textTheme: const TextTheme(
            headline1: TextStyle(fontWeight: FontWeight.w300, fontSize: 26),
            headline2: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
            bodyText1: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            bodyText2: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 14,
            )),

        // *** COLORS ***
        primarySwatch: Colors.green,
        primaryColorLight: Colors.green[50],
        primaryIconTheme: IconThemeData(color: Colors.black45),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Notes(title: 'Заметки'),
        '/settings': (context) => Settings(title: 'Настройки'),
        '/account': (context) => Account(title: 'Аккаунт'),
        '/about': (context) => About(title: 'О приложении'),
      },
    );
  }
}
