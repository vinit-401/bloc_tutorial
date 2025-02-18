
import 'dart:io';

import 'package:bloc_tutorial/api/api_config.dart';
import 'package:http/http.dart' as http;

class APIRequests{
  static getRequest(String uri)async{
    try{
      http.Response response =await http.get(Uri.parse("https://reqres.in/api/users?page=2"),headers: {"content-type":"application/json"});
      if(response.statusCode == 200){
        print(response.body);
        // return response.body;
      }
      print(response.statusCode);

    }
    catch(e){
      print(e);
    }
  }

 static Future<String?> postRequest(String requestUrl, Map<String, String> mapBody) async{
    try{
      http.Response res =await http.post(Uri.parse("$url$requestUrl"), body:mapBody );
      print(res.statusCode);
      if(res.statusCode == 200) {
        return res.body;
      }
      else {
        return null;
      }
    }
    on HttpException catch(e){
     print( e.message.toString);
     return null;
    }
  }
}