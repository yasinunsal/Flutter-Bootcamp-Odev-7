import 'package:odev7/data/entity/todos.dart';
import 'package:odev7/data/sqlite/veritabani.dart';

class ToDosDaoRepository{

  Future<List<ToDos>> toDoYukle() async{
    var db = await Veritabani.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM toDos");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return ToDos(id: satir["id"], name: satir["name"]);
    });
  }

  Future<void> kaydet(String name) async{
    var db = await Veritabani.veritabaniErisim();
    var bilgiler = Map<String, dynamic>();

    bilgiler["name"] = name;
    await db.insert("toDos", bilgiler);
  }

  Future<void> guncelle(int id, String name) async{
    var db = await Veritabani.veritabaniErisim();
    var bilgiler = Map<String, dynamic>();

    bilgiler["name"] = name;

    await db.update("toDos", bilgiler, where: "id=?", whereArgs: [id]);
  }

  Future<void> sil(int id) async{
    var db = await Veritabani.veritabaniErisim();
    await db.delete("toDos", where: "id=?", whereArgs: [id]);
  }

  Future<List<ToDos>> ara(String aramaKelimesi) async{
    var db = await Veritabani.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM toDos WHERE name like '%$aramaKelimesi%'");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return ToDos(id: satir["id"], name: satir["name"]);
    });
  }


}