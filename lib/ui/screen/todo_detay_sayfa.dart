import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/ui/cubit/todo_detay_cubit.dart';
import 'package:odev7/data/entity/todos.dart';

class ToDoDetaySayfa extends StatefulWidget {

  ToDos todo;
  ToDoDetaySayfa({required this.todo});

  @override
  State<ToDoDetaySayfa> createState() => _ToDoDetaySayfaState();
}

class _ToDoDetaySayfaState extends State<ToDoDetaySayfa> {
  var tfToDoName = TextEditingController();
  @override
  void initState() {
    super.initState();
    var todo = widget.todo;
    tfToDoName.text = todo.name;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To Do Detay"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfToDoName, decoration: const InputDecoration(hintText: "To Do Adı"),),
              ElevatedButton(onPressed: (){
                context.read<ToDoDetayCubit>().guncelle(widget.todo.id, tfToDoName.text);
              }, child: const Text("GÜNCELLE")),
            ],
          ),
        ),
      ),
    );
  }
}
