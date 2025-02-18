part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitialState extends TodoState {
  TodoInitialState() : super();
}

final class TodoSuccessState extends TodoState{
 final List<TodoModel> list;
  TodoSuccessState({required this.list});
}
final class TodoFailureState extends TodoState{
  final String errorMessage;
  TodoFailureState(this.errorMessage);
}
final class TodoLoadingState extends TodoState{
}

// initial empty State
// current State --> Success State
// failure State...
