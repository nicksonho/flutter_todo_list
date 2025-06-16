import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/todo_model.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tasksTile(context),
        deletedTile(context)
      ],
    );
  }

  ExpansionTile tasksTile(BuildContext context) {
    final tasks = Provider.of<ToDoModel>(context).taskList
      .where((item) => !item.isChecked)
      .toList();
    return ExpansionTile(
      title: Text("Tasks"),
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(tasks[index].toString()),
            );
          },
        ),
      ],
    );
  }

  ExpansionTile deletedTile(BuildContext context) {
    final deleted = Provider.of<ToDoModel>(context).recentlyDeleted;
    return ExpansionTile(
      title: Text("Recently Deleted"),
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: deleted.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(deleted[index].toString()),
            );
          },
        ),
      ],
    );
  } 
}