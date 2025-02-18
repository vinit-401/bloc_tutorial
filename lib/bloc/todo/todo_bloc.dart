import 'dart:convert';
import 'dart:io';

import 'package:bloc_tutorial/models/todo_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../helpers/pref_repository.dart';

part 'todo_state.dart';
part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<TodoModel> todoList = [];

  TodoBloc() : super(TodoInitialState()) {
    on<AddTodo>(_addTodo);
    on<RemoveTodo>(_removeTodo);
    on<UpdateTodo>(_updateTodo);
    on<GetTodoList>(_getTodoList);
    on<StoreTodoList>(_storeData);
  }

  _addTodo(AddTodo event, Emitter<TodoState> emit) async {
    /// first LOADING then everything.....
    emit(TodoLoadingState());
    await Future.delayed(
      Duration(seconds: 1),
      () {
        todoList.add(event.todoModel);
        add(StoreTodoList(list: todoList));
        emit(TodoSuccessState(list: todoList));
      },
    );
  }

  _updateTodo(UpdateTodo event, Emitter<TodoState> emit) {
    emit(TodoLoadingState());
    todoList[event.index].isCompleted = !todoList[event.index].isCompleted;
    add(StoreTodoList(list: todoList));
    emit(TodoSuccessState(list: todoList));
  }

  _removeTodo(RemoveTodo event, Emitter<TodoState> emit) {
    emit(TodoLoadingState());
    todoList.removeAt(event.index);
    add(StoreTodoList(list: todoList));
    emit(TodoSuccessState(list: todoList));
  }

  _storeData(StoreTodoList event, Emitter<TodoState> emit) {
    // SharedPreferenceRepository.storeTodoBloc(
    //   jsonEncode(
    //     event.list.map((e) => e.toJson()).toList(),
    //   ),
    // );
    SharedPreferenceRepository.storeTodoBloc(jsonEncode(todoList));
  }

  _getTodoList(GetTodoList event, Emitter<TodoState> emit) {
    String? jsonData = SharedPreferenceRepository.getTodoListBloc();
    if (jsonData == null) {
      todoList = [];
    } else {
      List<dynamic> jsonList = jsonDecode(jsonData);
      List<TodoModel> data = jsonList.map((e) => TodoModel.fromJson(e)).toList();
      todoList = data;
    }
    emit(TodoSuccessState(list: todoList));
  }

  // @override
  // TodoState? fromJson(Map<String, dynamic> json) {
  //   List<dynamic> list = jsonDecode(json.toString());
  //   List<TodoModel> data = list.map((e) =>  TodoModel.fromJson(e)).toList();
  //   return TodoSuccessState(list: data);
  // }
  //
  // @override
  // Map<String, dynamic>? toJson(TodoState state) {
  //   return Map.fromIterable(todoList,key: (element) => element[0],value: (element) => element[0],);
  // }
}
