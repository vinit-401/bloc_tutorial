import 'package:bloc_tutorial/bloc/theme/theme_bloc.dart';
import 'package:bloc_tutorial/cubit/load_cubit.dart';
import 'package:bloc_tutorial/ui/home_page_cubit.dart';
import 'package:bloc_tutorial/ui/home_page_bloc.dart';
import 'package:bloc_tutorial/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/todo/todo_bloc.dart';
import 'cubit/theme_cubit.dart';
import 'cubit/todo_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => TodoBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),BlocProvider(
          create: (context) => LoadCubit(),
        ),
      ],
      child: BlocBuilder<LoadCubit, int>(
        builder: (context, loadState) {
          return BlocBuilder<ThemeCubit, ThemeData>(
            builder: (contextCubit, themeCubicState) {
              return BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) => MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: context.read<LoadCubit>().state == 1? context.read<ThemeBloc>().themeData:contextCubit.read<ThemeCubit>().state,
                home: LandingScreen(),
              ),
            );
            },
          );
        },
      ),
    );
  }
}

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                context.read<LoadCubit>().select(0);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePageCubit(),
                  ),
                );
              },
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Text('Using Cubit'),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {

                context.read<LoadCubit>().select(1);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePageBloc(),
                  ),
                );
              },
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Text("Using Bloc"),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.login_outlined),
        onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
      },),
    );
  }
}
