class ToDoItem {
  String text;
  bool isChecked;

  ToDoItem({required this.text, this.isChecked = false});
  
  @override
  String toString() {
    return text;
  }
}