import 'package:bloc_tutorial/cubit/theme_cubit.dart';
import 'package:bloc_tutorial/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/todo_cubit.dart';

class HomePageCubit extends StatefulWidget {
  const HomePageCubit({super.key});

  @override
  State<HomePageCubit> createState() => _HomePageCubitState();
}

class _HomePageCubitState extends State<HomePageCubit> {
  final TextEditingController _titleController = TextEditingController();
  @override
  void initState() {
    context.read<TodoCubit>().getTodoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, List<TodoModel>>(
      builder: (context, todoList) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Todo"),
            actions: [
                IconButton(onPressed: () {
                  BlocProvider.of<ThemeCubit>(context,listen: false).toggleTheme();
                }, icon: context.read<ThemeCubit>().state == ThemeData.light()? Icon(Icons.dark_mode):Icon(Icons.light_mode))
            ],
          ),
          body: todoList.isEmpty
              ? Center(
                  child: Icon(
                  Icons.task_alt,
                  size: 45,
                ))
              : Center(
                  child: ListView.builder(
                    itemCount: todoList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Checkbox(
                          value: todoList[index].isCompleted,
                          onChanged: (value) {
                            context.read<TodoCubit>().toggleCheckBox(index);
                          },
                        ),
                        trailing: InkWell(
                            onTap: () {
                              context.read<TodoCubit>().deleteTodo(index);
                            },
                            child: Icon(
                              Icons.delete_outline_rounded,
                            )),
                        title: Text(todoList[index].title),
                      );
                    },
                  ),
                ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Add Todo"),
                        Focus(
                          focusNode: FocusNode().parent,
                          autofocus: true,
                          child: TextFormField(
                            controller: _titleController,
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            context.read<TodoCubit>().addTodo(TodoModel(title: _titleController.text.trim(),createdAt: DateTime.now().toString()));
                            // context.read<TodoCubit>().addTodo(
                            //       TodoModel(
                            //           title: "title", createdAt: DateTime.now().day.toString(), isCompleted: false),
                            //     );
                            _titleController.clear();
                            Navigator.pop(context);
                          },
                          child: Text("ADD"))
                    ],
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
