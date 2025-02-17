import 'package:bloc_tutorial/bloc/theme/theme_bloc.dart';
import 'package:bloc_tutorial/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo/todo_bloc.dart';

class HomePageBloc extends StatelessWidget {
  const HomePageBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo using Bloc"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeBloc>().add(ToggleEventTheme(ThemeData.light()));
            },
            icon: Icon(context.read<ThemeBloc>().themeData == ThemeData.light() ? Icons.dark_mode : Icons.light_mode),
          ),
        ],
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoInitialState) {
            return Center(
              child: Icon(Icons.task_outlined),
            );
          } else if (state is TodoLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TodoSuccessState) {
            return state.list.isEmpty ? Center(
                child: Icon(
                  Icons.task_alt,
                  size: 45,
                )):ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox(
                    value: state.list[index].isCompleted,
                    onChanged: (value) {
                      context.read<TodoBloc>().add(UpdateTodo(index: index));
                    },
                  ),
                  title: Text(state.list[index].title),
                  trailing: IconButton(
                      onPressed: () {
                        context.read<TodoBloc>().add(RemoveTodo(index: index));
                      },
                      icon: Icon(Icons.delete)),
                );
              },
            );
          } else {
            return Center(
              child: Text("Something went Wrong"),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.read<TodoBloc>().add(AddTodo(todoModel: TodoModel(title: 'Title', createdAt: 'date')));
        },
      ),
    );
  }
}
