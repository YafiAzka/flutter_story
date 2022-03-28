import 'package:flutter/material.dart';
import 'package:flutter_adobe_xd/ui/home/splash_page.dart';
import 'package:flutter_adobe_xd/ui/pages/login.dart';
import 'package:flutter_adobe_xd/ui/pages/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        // '/': (context) => Login(),
        // '/': (context) => Login(),
      },
    );
  }
}
