import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_flutter/data/hive.dart';
import 'package:todo_flutter/util/dialog_box.dart';
import 'package:todo_flutter/util/list_item.dart';

class Homepage extends StatefulWidget {

  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final box = Hive.box('TodoBox');

  final _controller = TextEditingController();

  var hiveOperations = HiveOperations();
  

  void funonchanged(bool? value,int index){
    setState(() {
      hiveOperations.updateTodo(index);
      hiveOperations.list[index][1]=!hiveOperations.list[index][1];
    });
  }

  void onSaved(){
    setState(() {
      hiveOperations.addTodo(_controller.text, false);
      hiveOperations.getTodos();
    });
    Navigator.of(context).pop();
    _controller.clear();
  }

  void deletFunction(int index){
    setState(() {
      hiveOperations.list.removeAt(index);
      hiveOperations.deleteTodo(index);
      hiveOperations.getTodos();
    });
  }

  void createNewTask(){
    showDialog(
      context: context, 
      builder: (context){
        return DialogBox(
          controller: _controller,
          onSaved: onSaved,
          onCancel: () => Navigator.of(context).pop(),);
      }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: const Center(child: Text('ToDo')),
        elevation: 0,
        backgroundColor: Colors.blue[700],
      ),
      body: ListView.builder(
          itemCount: hiveOperations.list.length,
          itemBuilder: (context,index){
            return Listitem(
              todoname: hiveOperations.list[index][0], 
              checked: hiveOperations.list[index][1], 
              onchanged: (value) => funonchanged(value, index),
              deletFunction:(context) => deletFunction(index),);
          },),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add)),
    );
  }
}