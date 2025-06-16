import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/home_page.dart';
import 'models/todo_model.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create:(context) => ToDoModel()
      ),
    ],
    child: MyApp()
    )
  );
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
      home: HomePage()
    );
  }
}