import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/cubit/todo_cubit.dart';
import 'package:to_do_list/model/to_dopage.dart';

import 'package:to_do_list/model/todo_model.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    TodoCubit cubit = BlocProvider.of<TodoCubit>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => ToDopage()));
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: BlocBuilder<TodoCubit, List<TodoModel>>(
          bloc:
              cubit, //actually the bloc here we dont need to specify,from the widget tree this will automatically tries to find out the required
          builder: (context, state) {
            //here state is the list of todomodel
            return ListView.builder(
              itemCount: state.length, //most important
              itemBuilder: (context, index) {
                var todo = state[index];
                return ListTile(
                  title: Text(todo.name),
                  trailing: Text(todo.createdat.toString()),
                );
              },
            );
          },
        ),
      ),
    );
  }
}


//in a list item always mention the  list count other wise this will be an error if the list is empty