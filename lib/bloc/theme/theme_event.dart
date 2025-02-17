part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent{}

class ToggleEventTheme extends ThemeEvent{
  final ThemeData themeData ;
  ToggleEventTheme(this.themeData);
}