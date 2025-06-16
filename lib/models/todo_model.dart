import 'package:flutter/material.dart';
import 'package:todo_list/todo_item.dart';

class ToDoModel extends ChangeNotifier {
  final List<ToDoItem> _taskList = [];
  final List<ToDoItem> _recentlyDeleted = [];

  List<ToDoItem> get taskList => _taskList;
  List<ToDoItem> get recentlyDeleted => _recentlyDeleted;
  

  void addToDoItem(ToDoItem todoItem) {
    _taskList.add(todoItem);
    notifyListeners();
  }

  void removeToDoItem(int index) {
    ToDoItem removedItem = _taskList.removeAt(index);
    _recentlyDeleted.add(removedItem);
    notifyListeners();
  }

  void toggleCheck(int index) {
    bool checked = _taskList[index].isChecked;
    _taskList[index].isChecked = !checked;
    notifyListeners();
  }

  void updateText(int index, String newText) {
    _taskList[index].text = newText;
    notifyListeners();
  }
}