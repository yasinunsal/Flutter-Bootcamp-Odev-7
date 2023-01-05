import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/data/repo/todosdao_repository.dart';

class ToDoKayitCubit extends Cubit<void>{

  ToDoKayitCubit():super(0);

  var trepo = ToDosDaoRepository();

  Future<void> kaydet(String name) async {
    await trepo.kaydet(name);
}
}