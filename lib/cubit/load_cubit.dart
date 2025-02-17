import 'package:flutter_bloc/flutter_bloc.dart';

class LoadCubit extends Cubit<int>{
  LoadCubit(): super(0);

  select(int tab){
    emit(tab);
  }
}