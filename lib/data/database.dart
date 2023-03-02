import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List TodoList1 = [];
  // reffence the box
  final _myBox = Hive.box("mybox");

  // run  this frist time
  void createIntialData() {
    TodoList1 = [
      ["Make Your ToDo List By Clickin Below Plus Icon", false]
    ];
  }

  // load the data from data base
  void loadData() {
    TodoList1 = _myBox.get("TODOLIST");
  }

  // update database
  void updateData() {
    _myBox.put("TODOLIST", TodoList1);
  }
}
