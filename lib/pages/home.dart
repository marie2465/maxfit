import 'package:flutter/material.dart';
import 'package:maxfit/domain/workout.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text('Maxfit'),
          leading: Icon(Icons.fitness_center),
        ),
        body: WorkoutsList(),
      ),
    );
  }
}

class WorkoutsList extends StatelessWidget {
  final workouts = <Workout>[
    Workout('Test1', 'Max1', 'Test workout1', 'Beginner'),
    Workout('Test2', 'Max2', 'Test workout2', 'Intermediate'),
    Workout('Test3', 'Max3', 'Test workout3', 'Advanced'),
    Workout('Test4', 'Max4', 'Test workout4', 'Beginner'),
    Workout('Test5', 'Max5', 'Test workout5', 'Intermediate'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
            itemCount: workouts.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2.0,
                margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(50, 65, 85, 0.9),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      child: Icon(
                        Icons.fitness_center,
                        color: Theme.of(context).textTheme.title!.color,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            width: 1,
                            color: Colors.white24,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      workouts[index].title,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.title!.color,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Theme.of(context).textTheme.title!.color,
                    ),
                    subtitle: subtitle(context, workouts[index]),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

Widget subtitle(BuildContext context, Workout workout) {
  var color = Colors.grey;
  double indicatorLevel = 0;
  switch (workout.level) {
    case 'Beginner':
      color = Colors.green;
      indicatorLevel = 0.33;
      break;
    case 'Intermediate':
      color = Colors.yellow;
      indicatorLevel = 0.66;
      break;
    case 'Advanced':
      color = Colors.red;
      indicatorLevel = 1;
      break;
  }
  return Row(
    children: <Widget>[
      Expanded(
        flex: 2,
        child: LinearProgressIndicator(
          backgroundColor: Theme.of(context).textTheme.title!.color,
          value: indicatorLevel,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
      SizedBox(width: 10),
      Expanded(
        flex: 2,
        child: Text(
          workout.level,
          style: TextStyle(color: Theme.of(context).textTheme.title!.color),
        ),
      ),
    ],
  );
}
