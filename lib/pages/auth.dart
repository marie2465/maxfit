import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maxfit/domain/person.dart';
import 'package:maxfit/services/auth.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  late String _email;
  late String _password;
  bool showLogin = true;

  AuthServices _authService = AuthServices();

  Widget _logo() {
    return Padding(
      padding: EdgeInsets.only(top: 100),
      child: Container(
        child: Align(
          child: Text(
            'MAXFIT',
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _input(
      Icon icon, String hint, TextEditingController controller, bool obscure) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: TextStyle(fontSize: 20.0, color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white30),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 3),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white54, width: 1),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              left: 10.0,
              right: 10.0,
            ),
            child: IconTheme(
              data: IconThemeData(color: Colors.white30),
              child: icon,
            ),
          ),
        ),
      ),
    );
  }

  Widget _button(String text, void func()) {
    return RaisedButton(
      splashColor: Theme.of(context).primaryColor,
      highlightColor: Theme.of(context).primaryColor,
      color: Colors.white,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
          fontSize: 20.0,
        ),
      ),
      onPressed: () {
        func();
      },
    );
  }

  Widget _form(String label, void func()) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: 20,
              top: 10,
            ),
            child: _input(Icon(Icons.email), 'Email', _emailcontroller, false),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 20,
            ),
            child:
                _input(Icon(Icons.lock), 'Password', _passwordcontroller, true),
          ),
          SizedBox(
            width: 20,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: _button(label, func),
            ),
          )
        ],
      ),
    );
  }

  void _loginbuttonAction() async {
    _email = _emailcontroller.text;
    _password = _passwordcontroller.text;

    if (_email.isEmpty || _password.isEmpty) return;

    Person? person = await _authService.signInWithEmailAndPassword(
        _email.trim(), _password.trim());
    if (person == null) {
      Fluttertoast.showToast(
        msg: "Can't SignIn you. Please check your email/password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      _emailcontroller.clear();
      _passwordcontroller.clear();
    }
  }

  void _registerbuttonAction() async {
    _email = _emailcontroller.text;
    _password = _passwordcontroller.text;

    if (_email.isEmpty || _password.isEmpty) return;

    Person? person = await _authService.registerWithEmailAndPassword(
        _email.trim(), _password.trim());
    if (person == null) {
      Fluttertoast.showToast(
        msg: "Can't Register you. Please check your email/password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      _emailcontroller.clear();
      _passwordcontroller.clear();
    }
  }

  Widget _bottomWave() {
    return Expanded(
      child: Align(
        child: ClipPath(
          child: Container(
            color: Colors.white,
            height: 300,
          ),
          clipper: BottomWaveClipper(),
        ),
        alignment: Alignment.bottomCenter,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Scrollbar(
        child: Column(
          children: <Widget>[
            _logo(),
            SizedBox(
              height: 120,
            ),
            (showLogin
                ? Column(
                    children: [
                      _form('LOGIN', _loginbuttonAction),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                          child: Text(
                            'Not registered yet? register!',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              showLogin = false;
                            });
                          },
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      _form('Register', _registerbuttonAction),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                          child: Text(
                            'Already registered? Login!',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              showLogin = true;
                            });
                          },
                        ),
                      )
                    ],
                  )),
            _bottomWave(),
          ],
        ),
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height + 5);
    var secondControlPoint = Offset(size.width - (size.width / 6), size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
