import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /*
  Map<String, String> Task1 = {"task": 'Understand Code'};
  Map<String, bool> State1 = {"set": true};
  Map<String, String> Task2 = {"task": 'Figure out duplication'};
  Map<String, bool> State2 = {"set": false};
  Map<String, String> Task3 = {"task": 'Refactor'};
  Map<String, bool> State3 = {"set": true};
  Map<String, String> Task4 = {"task": 'Add comments'};
  Map<String, bool> State4 = {"set": false};
  Map<String, String> Task5 = {"task": 'commit code'};
  Map<String, bool> State5 = {"set": false};
  Map<String, String> Task6 = {"task": 'push to github'};
  Map<String, bool> State6 = {"set": false};
  */

  List<Map<String, String>> Tasks = [
    {"task": 'Understand Code'},
    {"task": 'Figure out duplication'},
    {"task": 'Refactor'},
    {"task": 'Add comments'},
    {"task": 'commit code'},
    {"task": 'push to github'},
  ];
  List<Map<String, bool>> States = [
    {"set": true},
    {"set": false},
    {"set": true},
    {"set": false},
    {"set": false},
    {"set": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Your Tasks'),
      ),
      body: Container(
        color: Colors.teal,
        // REFACTOR INTO ListView.builder
        child: ListView.builder(
          itemCount: Tasks.length,
          itemBuilder: (context, i) {
            return TaskList(Tasks[i]["task"], States[i]["set"]);
          },
        ),
      ),
    );
  }
}

class TaskList extends StatefulWidget {
  String thing;
  bool checked;
  TaskList(this.thing, this.checked);

  @override
  _TaskListState createState() => _TaskListState(thing, checked);
}

class _TaskListState extends State<TaskList> {
  String thing;
  bool checked;
  _TaskListState(this.thing, this.checked);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CheckboxListTile(
        value: checked,
        onChanged: (newValue) {
          setState(() {
            checked = newValue;
          });
        },
        activeColor: Colors.teal,
        title: Text(thing,
            style: TextStyle(
              fontSize: 20,
              fontStyle: checked ? FontStyle.italic : FontStyle.normal,
              color: checked ? Colors.grey : Colors.black,
            )),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
