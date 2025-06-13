import 'package:flutter/material.dart';
import '../widgets/my_navigation_bar.dart';
import '../pages/statistics_page.dart'; // Import the StatisticPage


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
  const MyCheckbox({super.key});

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