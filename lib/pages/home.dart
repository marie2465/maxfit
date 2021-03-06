import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:maxfit/components/active-workouts.dart';
import 'package:maxfit/components/workouts-list.dart';
import 'package:maxfit/services/auth.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    var navigationBar = CurvedNavigationBar(
      items: const [
        Icon(Icons.fitness_center),
        Icon(Icons.search),
      ],
      index: 0,
      height: 50,
      color: Colors.white.withOpacity(0.5),
      buttonBackgroundColor: Colors.white,
      backgroundColor: Colors.white.withOpacity(0.5),
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 500),
      onTap: (int index) {
        setState(() => sectionIndex = index);
      },
    );

    return Container(
      child: Scaffold(
          backgroundColor: Theme
              .of(context)
              .primaryColor,
          appBar: AppBar(
            title: Text('Maxfit // ' +
                (sectionIndex == 0 ? 'Active Workouts' : 'FindWorkouts')),
            leading: Icon(Icons.fitness_center),
            actions: <Widget>[
              FlatButton.icon(
                onPressed: () {
                  AuthServices().logOut();
                },
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
                label: SizedBox.shrink(),
              )
            ],
          ),
          body: sectionIndex == 0 ? ActiveWorkouts() : WorkoutsList(),
          bottomNavigationBar: navigationBar,
      ),
    );
  }
}
