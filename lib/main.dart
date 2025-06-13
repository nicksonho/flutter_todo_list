import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

class StatisticModel extends ChangeNotifier {
  List<String> _currentList;
  List<String> _recentlyDeleted;

  StatisticModel({
    required List<String> currentList,
    required List<String> recentlyDeleted,
  }) : _currentList = currentList,
       _recentlyDeleted = recentlyDeleted;

  // Getter methods (expose lists without allowing direct modification)
  List<String> get currentList => List.unmodifiable(_currentList);
  List<String> get recentlyDeleted => List.unmodifiable(_recentlyDeleted);

  void addCurrent(String item) {
    _currentList = [..._currentList, item];
    notifyListeners(); // Critical for UI updates
  }

  void addDeleted(String item) {
    _recentlyDeleted = [..._recentlyDeleted, item];
    notifyListeners();
  }

  void removeCurrent(String item) {
    _currentList = _currentList.where((i) => i != item).toList();
    _recentlyDeleted = [..._recentlyDeleted, item];
    notifyListeners();
  }
}