import 'package:flutter/material.dart';
import 'package:todo_list/todo_item.dart';

class ToDoItemTile extends StatelessWidget {
  final ToDoItem item;
  final ValueChanged<bool?> onChanged;
  final ValueChanged<String> onTextChanged;
  final VoidCallback onRemove;

  const ToDoItemTile({
    super.key,
    required this.item,
    required this.onChanged,
    required this.onTextChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: item.isChecked,
          onChanged: onChanged,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: TextField(
              controller: TextEditingController(text: item.text),
              onChanged: onTextChanged,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: onRemove,
          icon: Icon(Icons.delete),
        ),
      ],
    );
  }
}