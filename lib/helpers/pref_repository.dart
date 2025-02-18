import 'package:bloc_tutorial/helpers/pref_repository_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceRepository {
  static Future<void> initialise() async {
    await SharedPreferenceRepositoryHelper.init();
  }

  static Future<void> storeTodoCubit(String todoListJson) async {
    print(todoListJson);
    await SharedPreferenceRepositoryHelper.setString("Cubit_Data", todoListJson);
  }

  static Future<void> storeTodoBloc(String todoListJson) async {
    await SharedPreferenceRepositoryHelper.setString("Bloc_Data", todoListJson);
  }

  static String? getTodoListCubit() {
    return SharedPreferenceRepositoryHelper.getString("Cubit_Data");
  }

  static String? getTodoListBloc() {
    return SharedPreferenceRepositoryHelper.getString("Bloc_Data");
  }
}
