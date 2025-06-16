import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/todo_model.dart';
import 'package:todo_list/todo_item.dart';
import '../widgets/my_navigation_bar.dart';
import '../pages/statistics_page.dart';
import '../widgets/todo_item_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  void _onDestinationSelected(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget page;
    if (currentPageIndex == 0) {
      page = ListColumn();
    } else if (currentPageIndex == 1) {
      page = StatisticPage();
    } else {
      page = Placeholder();
    }
    return Scaffold(
      appBar: appBar(),
      body: page,
      bottomNavigationBar: MyNavigationBar(
        currentIndex: currentPageIndex,
        onDestinationSelected: _onDestinationSelected
      )
    );
  }
}


AppBar appBar() {
  return AppBar(
    centerTitle: true,
    title: Text('To-do list'),
    titleTextStyle: TextStyle(
      color: Color.fromARGB(255, 110, 54, 8),
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: Color.fromARGB(255, 206, 172, 144),
  );
}


class ListColumn extends StatelessWidget{
  const ListColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final todoModel = Provider.of<ToDoModel>(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: todoModel.taskList.length,
        itemBuilder: (context, index) {
          final item = todoModel.taskList[index];
          return Padding(
            padding: const EdgeInsets.all(8),
            child: ToDoItemTile(
              item: item,
              onChanged: (checked) {
                if (checked != null) {
                  todoModel.toggleCheck(index);
                }
              },
              onTextChanged: (text) => todoModel.updateText(index, text),
              onRemove: () => todoModel.removeToDoItem(index),
            )
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => todoModel.addToDoItem(ToDoItem(text:'')),
        child: Icon(Icons.add)), 
    );
  }
}