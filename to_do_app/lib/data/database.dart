

import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  // Reference our box
  final _myBox = Hive.box("mybox");

  // Run this method if this is the first time ever opening this app
  void createInitialData() {
    toDoList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }

  // Load the data from database
  void loadData() {
    if (_myBox.get("TODOLIST") != null) {
      toDoList = _myBox.get("TODOLIST");
    } else {
      toDoList = []; // Initialize to an empty list if no data exists
    }
  }

  // Update the database
  void updateDatabase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
