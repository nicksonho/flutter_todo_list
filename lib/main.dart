import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/pages/statistics_page.dart';
import '../pages/home_page.dart';


void main() {
  runApp(ChangeNotifierProvider(
    create:(context) => StatisticModel(
      currentList: [],
      recentlyDeleted: [],
    ),
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