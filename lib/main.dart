import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/cubit/todo_cubit.dart';
import 'package:to_do_list/model/homescreen.dart';

void main(List<String> args) {
  runApp(ToDoList());
}

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => TodoCubit())],
      child: MaterialApp(home: Homescreen()),
    );
  }
}
