import 'package:flutter/material.dart';
import 'package:maxfit/domain/workout.dart';
import 'package:maxfit/pages/auth.dart';
import 'package:maxfit/pages/home.dart';

void main() {
  runApp(MaxFitApp());
}

class MaxFitApp extends StatelessWidget {
  const MaxFitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MaxFit",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(50, 65, 85, 1),
        textTheme: TextTheme(
          title: TextStyle(color: Colors.white),
        ),
      ),
      home: AuthorizationPage(),
    );
  }
}
