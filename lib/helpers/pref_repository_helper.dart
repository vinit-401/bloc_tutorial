import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceRepositoryHelper {
  static late SharedPreferences preferences;
  static  Future<void> init() async{
    preferences = await SharedPreferences.getInstance();
  }

  static setString(String key, String value){
    preferences.setString(key, value);
  }
  static String? getString(String key){
    return preferences.getString(key);
  }
}