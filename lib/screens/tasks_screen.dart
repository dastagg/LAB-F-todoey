import 'package:flutter/material.dart';
import 'add_task_screen.dart';
import '../models/task.dart';
import '../widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State {
  List tasks = [
    Task(name: 'Task name here', isDone: false),
    Task(name: 'Task name here', isDone: false),
    Task(name: 'Task name here', isDone: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => AddTaskScreen(
                addNewTask: (newTaskTitle) {
                  setState(() {
                    tasks.add(Task(name: newTaskTitle));
                  });
                  Navigator.pop(context);
                },
              ),
            );
          }),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(top: 60, left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.list,
                  size: 35,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Todoey',
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                '${tasks.length} tasks',
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              // child: TaskList(tasks: tasks),
            ),
          ),
        ),
      ]),
    );
  }
}