part of 'todo_bloc.dart';
@immutable
sealed class TodoEvent {}

final class AddTodo extends TodoEvent {
  final TodoModel todoModel;
  AddTodo({required this.todoModel});
}

final class RemoveTodo extends TodoEvent {
  final int index;
  RemoveTodo({required this.index});
}

final class UpdateTodo extends TodoEvent{
  final int index;
  UpdateTodo({required this.index});
}