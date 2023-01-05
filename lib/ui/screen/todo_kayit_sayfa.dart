import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/ui/cubit/todo_detay_cubit.dart';
import 'package:odev7/ui/cubit/todo_kayit_cubit.dart';

class ToDoKayitSayfa extends StatefulWidget {
  const ToDoKayitSayfa({Key? key}) : super(key: key);

  @override
  State<ToDoKayitSayfa> createState() => _ToDoKayitSayfaState();
}

class _ToDoKayitSayfaState extends State<ToDoKayitSayfa> {

  var tfToDoName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To Do Kayıt")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfToDoName, decoration: const InputDecoration(hintText: "To Do Ad"),),
              ElevatedButton(onPressed: (){
                context.read<ToDoKayitCubit>().kaydet(tfToDoName.text);
              }, child: const Text("KAYDET")),
            ],
          ),
        ),
      ),
    );
  }
}
