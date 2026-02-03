import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/cubit/todo_cubit.dart';

class ToDopage extends StatefulWidget {
  const ToDopage({super.key});

  @override
  State<ToDopage> createState() => _ToDopageState();
}

class _ToDopageState extends State<ToDopage> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    TodoCubit cubit = BlocProvider.of<TodoCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(controller: textEditingController),
            ElevatedButton(
              onPressed: () {
                cubit.addtodo(textEditingController.text);
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    textEditingController.dispose();
  }
}


//whenever we want some cubit or bloc,you just need to ask the bloc provider 
//All the registered blocs will be available through the function BlocProvider.of<Cubitname>(context)
//in the case of builders or listeners we dont need the bloc or cubit to be passed even if we dont pass we can
///cubit can find through the widget tree
