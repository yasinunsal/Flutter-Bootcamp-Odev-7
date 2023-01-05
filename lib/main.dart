import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/ui/cubit/anasayfa_cubit.dart';
import 'package:odev7/ui/cubit/todo_detay_cubit.dart';
import 'package:odev7/ui/cubit/todo_kayit_cubit.dart';
import 'package:odev7/ui/screen/anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
         BlocProvider(create: (context) => ToDoKayitCubit()),
          BlocProvider(create: (context) => ToDoDetayCubit()),
          BlocProvider(create: (context) => AnasayfaCubit()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Anasayfa(),
        ),
    );
  }
}


