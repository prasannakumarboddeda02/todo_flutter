
import 'package:hive_flutter/hive_flutter.dart';

class HiveOperations{
  final box = Hive.box('TodoBox');

  var list = [];

  HiveOperations(){
    getTodos();
  }

  Future<void> addTodo(String todo,bool checked) async{
    await box.add([todo,checked]);
  }

  void getTodos(){
    list = box.values.toList();
    if(list.isEmpty){
      list.add(['Empty',false]);
    }
  }

  Future<void> deleteTodo(int index) async{
    await box.deleteAt(index);
  }

  Future<void> updateTodo(int index) async{
    await box.putAt(index, [list[index][0],!list[index][1]]);
  }
}