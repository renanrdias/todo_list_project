// ignore_for_file: prefer_const_constructors_in_immutables,
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?)? checkboxCallback;
  final Function()? longPressCallback;

  TaskTile({this.isChecked = false, required this.taskTitle, this.checkboxCallback, this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
