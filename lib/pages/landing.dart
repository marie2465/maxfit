import 'package:flutter/material.dart';
import 'package:maxfit/domain/person.dart';
import 'package:maxfit/pages/auth.dart';
import 'package:maxfit/pages/home.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Person? person = Provider.of<Person?>(context);
    final bool isLogin = person != null;

    return isLogin ? HomePage() : AuthorizationPage();
  }
}
