import 'package:flutter/material.dart';
import 'package:todo_list/todo_item.dart';

class ToDoModel extends ChangeNotifier {
  final List<ToDoItem> _taskList = [];

  List<ToDoItem> get taskList => _taskList;

  void addToDoItem(String text) {
    _taskList.add(ToDoItem(text: text));
    notifyListeners();
  }

  void removeToDoItem(int index) {
    _taskList.removeAt(index);
    notifyListeners();
  }

  void toggleCheck(int index) {
    _taskList[index].isChecked = !_taskList[index].isChecked;
    notifyListeners();
  }

  void updateText(int index, String newText) {
    _taskList[index].text = newText;
    notifyListeners();
  }
}