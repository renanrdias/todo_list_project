// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String newTaskTitle;

    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 117, 117, 117),
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
              SizedBox(height: 20.0),
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 26.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
              ),
              SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                ),
                child: TextButton(
                  onPressed: () {
                    final task = Task(name: newTaskTitle);
                    Provider.of<TaskData>(context, listen: false).addTask(task);

                    Navigator.pop(context);
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
