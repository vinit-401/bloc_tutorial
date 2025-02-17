part of 'theme_bloc.dart';


@immutable
sealed class ThemeState{}
class InitialThemeState extends ThemeState{
}
class CurrentThemeState extends ThemeState{
 final ThemeData themeData;
 CurrentThemeState({required this.themeData}): super();
}