import 'package:flutter/material.dart';
import 'package:note_flutter/components/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:note_flutter/models/task_data.dart';
import 'package:note_flutter/components/delete_coloredbox.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return Dismissible(
            direction: DismissDirection.endToStart,
            background: const DeleteColoredBox(),
            key: Key(task.name),
            confirmDismiss: (direction) async {
              final snackBar = SnackBar(
                padding: const EdgeInsets.all(20.0),
                content: Text(
                  '${task.name} is deleted',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              );
              final confirmed = await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Are you sure you want to delete?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("No"),
                        ),
                        TextButton(
                          onPressed: () {
                            taskData.deleteDask(task);
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          child: const Text('Yes'),
                        )
                      ],
                    );
                  });
              return confirmed;
            },
            child: TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkboxCallback: (bool? checkboxState) {
                  taskData.updateTask(task);
                }),
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
