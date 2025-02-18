import 'dart:convert';

import 'package:bloc_tutorial/helpers/pref_repository.dart';
import 'package:bloc_tutorial/models/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// cubit --> functions
//bloc ---> events
class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);

  addTodo(TodoModel todo) {
    emit([...state, todo]);
    storeTodoList();
  }

  toggleCheckBox(int index) {
    List<TodoModel> updatedList = List.from(state);
    updatedList[index].isCompleted = !updatedList[index].isCompleted;
    emit(updatedList);
    storeTodoList();
  }

  deleteTodo(int index) {
    List<TodoModel> updatedList = List.from(state);
    updatedList.removeAt(index);
    emit(updatedList);
    storeTodoList();
  }

  storeTodoList() {
    SharedPreferenceRepository.storeTodoCubit(
      jsonEncode(
        state.map((e) => e.toJson()).toList(),
      ),
    );
  }
    
 getTodoList(){
    String? jsonData =  SharedPreferenceRepository.getTodoListCubit();
    if(jsonData == null){
      emit([]);
    }
    else{
      List<dynamic> jsonList = jsonDecode(jsonData);
      List<TodoModel> data = jsonList.map((e) => TodoModel.fromJson(e)).toList();
      emit(data);
    }
  }

  @override
  void onChange(Change<List<TodoModel>> change) {
    print(change);
    super.onChange(change);
  }
}
