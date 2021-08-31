import 'package:flutter/material.dart';
import 'package:maxfit/components/active-workouts.dart';
import 'package:maxfit/components/workouts-list.dart';
import 'package:maxfit/domain/workout.dart';
import 'package:maxfit/pages/auth.dart';
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
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
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
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.fitness_center), title: Text('My Workouts')),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), title: Text('Find Workouts')),
          ],
          currentIndex: sectionIndex,
          backgroundColor: Colors.white30,
          selectedItemColor: Colors.white,
          onTap: (int index) {
            setState(() => sectionIndex = index);
          },
        ),
      ),
    );
  }
}
