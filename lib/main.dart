import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maxfit/pages/landing.dart';
import 'package:maxfit/services/auth.dart';
import 'package:provider/provider.dart';

import 'domain/person.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaxFitApp());
}

class MaxFitApp extends StatelessWidget {
  const MaxFitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Person?>.value(
      value: AuthServices().currentUser,
      initialData: null,
      child: MaterialApp(
        title: "MaxFit",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(50, 65, 85, 1),
          textTheme: TextTheme(
            title: TextStyle(color: Colors.white),
          ),
        ),
        home: LandingPage(),
      ),
    );
  }
}
