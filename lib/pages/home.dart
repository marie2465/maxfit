import 'package:flutter/material.dart';
import 'package:maxfit/components/workouts-list.dart';
import 'package:maxfit/domain/workout.dart';
import 'package:maxfit/pages/auth.dart';
import 'package:maxfit/services/auth.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  int sectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text('Maxfit'),
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
        body: WorkoutsList(),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center),
              title: Text('My Workouts')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Find Workouts')
            ),
          ],
          currentIndex: 0,
          backgroundColor: Colors.white30,
          onTap: (int index){
            sectionIndex = index;
          },
        ),
      ),
    );
  }
}
