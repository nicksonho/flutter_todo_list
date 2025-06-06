import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-do list',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 206, 172, 144)
      ),
      home: TodoPage()
    );
  }
}
class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: appBar(),
      body: ListColumn(),
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



class ListColumn extends StatefulWidget {
  const ListColumn({super.key});

  @override
  State<ListColumn> createState() => _ListColumnState();
}

class _ListColumnState extends State<ListColumn> {
  final List<TextEditingController> _controllers = [];

  void _addTodoItem() {
    setState(() {
      _controllers.add(TextEditingController());
    });
  }

  void _removeTodoItem(int index) {
    setState(() {
      _controllers.removeAt(index);
    });
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _controllers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                MyCheckbox(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _controllers[index],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      )
                    ),
                  )  
                ),
                IconButton(
                  onPressed: () => _removeTodoItem(index), 
                  icon: Icon(Icons.delete)
                )              
              ]
            )
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodoItem,
        child: Icon(Icons.add)), 
    );
  }
}

class MyCheckbox extends StatefulWidget {
  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (bool? newValue) {
        setState(() {
          isChecked = newValue ?? false;
        });
      },
    );
  }
}