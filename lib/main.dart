import 'package:flutter/material.dart';
import 'package:posts/splash/view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        appBarTheme: AppBarTheme(
          color: Colors.black
        ),
        accentColor: Colors.black38,
      ),
      home: SplashScreen(),
    );
  }
}
