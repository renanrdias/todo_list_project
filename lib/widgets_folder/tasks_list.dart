import 'package:flutter/material.dart';
import 'package:todoey_project/widgets_folder/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_project/models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              taskTitle: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(taskData.tasks[index]);
              },
              longPressCallback: () {
                taskData.removeTask(taskData.tasks[index]);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
