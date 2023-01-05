import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/data/repo/todosdao_repository.dart';

class ToDoDetayCubit extends Cubit<void>{

  ToDoDetayCubit():super(0);

  var trepo = ToDosDaoRepository();

  Future<void> guncelle(int id, String name) async{
    await trepo.guncelle(id, name);
  }
}