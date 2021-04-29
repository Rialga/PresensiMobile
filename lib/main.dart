import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FirstPage());
  }
}

class FirstPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new LoginPage(),
      image: Image.asset("assets/images/Logo.png"),
      backgroundColor: Colors.cyan[400],
      photoSize: 80.0,
      useLoader: false,
    );
  }
}
