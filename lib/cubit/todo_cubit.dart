import 'package:bloc_tutorial/models/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// cubit --> functions
//bloc ---> events
class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);

  addTodo(TodoModel todo) {
    emit([...state, todo]);
  }

  toggleCheckBox(int index) {
    List<TodoModel> updatedList = List.from(state);
    updatedList[index].isCompleted = !updatedList[index].isCompleted;
    emit(updatedList);
  }

  deleteTodo(int index) {
    List<TodoModel> updatedList = List.from(state);
    updatedList.removeAt(index);
    emit(updatedList);
  }

  @override
  void onChange(Change<List<TodoModel>> change) {
    print(change);
    super.onChange(change);
  }
}
