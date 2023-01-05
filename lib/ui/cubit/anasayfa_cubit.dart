import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/data/entity/todos.dart';
import 'package:odev7/data/repo/todosdao_repository.dart';

class AnasayfaCubit extends Cubit<List<ToDos>>{

  AnasayfaCubit():super(<ToDos>[]);

  var trepo = ToDosDaoRepository();

  Future<void> todoYukle() async {
    var liste = await trepo.toDoYukle();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async {
    var liste = await trepo.ara(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int id) async {
    await trepo.sil(id);
    await todoYukle();
  }
}