import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TasksTile(context),
        DeletedTile(context)
      ],
    );
  }

  ExpansionTile TasksTile(BuildContext context) {
    final tasks = Provider.of<StatisticModel>(context).currentList;
    return ExpansionTile(
      title: Text("Tasks"),
      children: [
          ListView.builder(

            
          shrinkWrap: true,
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(tasks[index]),
            );
          },
        ),
      ],
    );
  }

  ExpansionTile DeletedTile(BuildContext context) {
    final deleted = Provider.of<StatisticModel>(context).recentlyDeleted;
    return ExpansionTile(
      title: Text("Recently Deleted"),
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: deleted.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(deleted[index]),
            );
          },
        ),
      ],
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