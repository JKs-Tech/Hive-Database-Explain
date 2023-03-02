import 'package:flutter/material.dart';
import 'package:new_todo/data/database.dart';
import 'package:new_todo/screens/widgets/dilog_box.dart';
import 'package:new_todo/screens/widgets/todo_list.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //reffrence hive box
  final _myBox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();
  @override
  void initState() {
    // if the frist time
    if (_myBox.get("TODOLIST") == null) {
      db.createIntialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

// Text Controller

  final _controller = TextEditingController();

  // todo list
  // List TodoList1 = [
  //   ["Jakvan", false],
  //   ["go to chhapi", false],
  //   ["for practise english", false]
  // ];

  // chekbox checked
  void chekBoxChecked(bool? value, int index) {
    db.TodoList1[index][1] = !db.TodoList1[index][1];
    db.updateData();
    setState(() {});
  }

// save new task
  void submitTask() {
    setState(() {
      db.TodoList1.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  // delet task
  void delettask(int index) {
    setState(() {
      db.TodoList1.removeAt(index);
      db.updateData();
    });
  }

  // Dilog box
  void DilogBox() {
    showDialog(
      context: context,
      builder: (context) {
        return DilogBoxw(
          controller: _controller,
          onSaved: submitTask,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        elevation: 0,
        title: Center(
            child: Text(
          "ToDo List",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        )),
      ),
      body: ListView.builder(
        itemCount: db.TodoList1.length,
        itemBuilder: (context, index) {
          return ToDoList(
            newTask: db.TodoList1[index][0],
            taskCompleted: db.TodoList1[index][1],
            onChanged: (value) => chekBoxChecked(value, index),
            deletFunction: (context) => delettask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: DilogBox,
        backgroundColor: Colors.yellow,
        elevation: 10,
        child: Icon(
          Icons.add,
          color: Colors.black,
          size: 32,
        ),
      ),
      // ToDoList(newTask: "Jakvan", onChanged: (p0) {}, taskCompleted: true),
    );
  }
}
