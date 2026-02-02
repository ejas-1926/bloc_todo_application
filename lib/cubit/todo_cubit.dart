import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/model/todo_model.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);

  void addtodo(String todotext) {
    final newstate = [
      ...state,
      TodoModel(name: todotext, createdat: DateTime.now()),
    ];
    emit(newstate);
  }
}


//in this app what we are trying to do if someone adds something on the to do it should get displayed
//so what value are trying to manage ie what state we are trying to manage
//list of todos
//we are maintaining a list of todos
///if someone deletes or adds something the state of this needs to be managed
///we are storing all this on a todo list and displaying this 
///initially we are passing an empty list
///here we are maintaining the state of the list ie what all values in the list
///initially this is an empty list 
///one more thing is when we add a value to  a list that is not possible state will not get reflected like that 
///we need to create new instances of list each time 
///
///
// earlier we were doing just state + 1 in the other project actually we are sending a new instance every time whether its int or list or what ever 
//so even if we add or delete or something then what we will do is we will create a new list each time and emit that 