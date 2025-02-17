import 'package:bloc_tutorial/models/todo_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_state.dart';

part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<TodoModel> todoList = [];

  TodoBloc() : super(TodoInitialState()) {
    on<AddTodo>(_addTodo);
    on<RemoveTodo>(_removeTodo);
    on<UpdateTodo>(_updateTodo);
  }

  _addTodo(AddTodo event, Emitter<TodoState> emit) async {
    /// first LOADING then everything.....
    emit(TodoLoadingState());
    await Future.delayed(
      Duration(seconds: 1),
      () {
        todoList.add(event.todoModel);
        emit(TodoSuccessState(list: todoList));
      },
    );
  }

  _updateTodo(UpdateTodo event, Emitter<TodoState> emit) {
    emit(TodoLoadingState());
    todoList[event.index].isCompleted = !todoList[event.index].isCompleted;
    emit(TodoSuccessState(list: todoList));
  }

  _removeTodo(RemoveTodo event, Emitter<TodoState> emit) {
    emit(TodoLoadingState());
    todoList.removeAt(event.index);
    emit(TodoSuccessState(list: todoList));
  }
}
