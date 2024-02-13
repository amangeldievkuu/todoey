import 'package:flutter/material.dart';
import 'package:note_flutter/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;

    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.lightBlue,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onSubmitted: (value) {
              Provider.of<TaskData>(context, listen: false).addTask(value);
              Navigator.pop(context);
            },
            onChanged: (newValue) {
              newTaskTitle = newValue;
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.lightBlue,
            ),
            onPressed: () {
              Provider.of<TaskData>(context, listen: false)
                  .addTask(newTaskTitle ?? "null");
              Navigator.pop(context);
            },
            child: const Text(
              'Add',
            ),
          ),
        ],
      ),
    );
  }
}
