import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/data/entity/todos.dart';
import 'package:odev7/ui/cubit/anasayfa_cubit.dart';
import 'package:odev7/ui/screen/todo_detay_sayfa.dart';
import 'package:odev7/ui/screen/todo_kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  bool aramaYapiliyorMu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
        TextField(
          decoration: const InputDecoration(hintText: "Ara"),
          onChanged: (aramaSonucu){
            context.read<AnasayfaCubit>().ara(aramaSonucu);
          },
        ) :
        const Text("Kisiler"),
        actions: [
          aramaYapiliyorMu ?
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = false;
              context.read<AnasayfaCubit>().todoYukle();
            });
          }, icon: Icon(Icons.clear)) :
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = true;
            });
          }, icon: Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<AnasayfaCubit, List<ToDos>>(
        builder: (context, toDosList){
          if(toDosList.isNotEmpty){
            return ListView.builder(
                itemCount: toDosList.length,
                itemBuilder: (context, index){
                  var todo = toDosList[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ToDoDetaySayfa(todo: todo)))
                          .then((value) { context.read<AnasayfaCubit>().todoYukle(); });
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${todo.name}"),
                          ),
                          const Spacer(),
                          IconButton(onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text("${todo.name} silinsin mi?"),
                                  action: SnackBarAction(
                                      label: "Evet",
                                      onPressed: (){
                                        context.read<AnasayfaCubit>().sil(todo.id);
                                      },
                                  ),
                              ),
                            );
                          }, icon: const Icon(Icons.delete_outline, color: Colors.black54,)),
                        ],
                      ),
                    ),
                  );
                },
            );
          }else{
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ToDoKayitSayfa()))
                .then((value) { context.read<AnasayfaCubit>().todoYukle(); });
          },
          child: const Icon(Icons.add),
      ),
    );
  }
}
