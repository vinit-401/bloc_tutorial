import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';
part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState>{
  ThemeData? themeData;
  ThemeBloc(): super(InitialThemeState()){
    on<ToggleEventTheme>(_toggleEventTheme);
  }
  void _toggleEventTheme(ToggleEventTheme event, Emitter<ThemeState> emit){
    themeData = themeData == ThemeData.light()? ThemeData.dark():ThemeData.light();
    emit(CurrentThemeState(themeData: themeData!));
  }
}