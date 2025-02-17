import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData>{
  ThemeCubit(): super(ThemeData.light());

  toggleTheme(){
    emit(state == ThemeData.light()? ThemeData.dark():ThemeData.light());
  }
}