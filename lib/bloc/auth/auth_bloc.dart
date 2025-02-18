
import 'dart:convert';

import 'package:bloc_tutorial/api/network_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  // inside constructor
  AuthBloc() : super(AuthSuccess(token: '')){
    on<AuthLoginEvent>(_loginRequest);
  }


  _loginRequest(AuthLoginEvent event, Emitter<AuthState> emit)async{
    emit(AuthLoading());
    if(event.email != null && event.password != null){
      print("email");
      String? jsonResponse = await APIRequests.postRequest('/login', {"email": event.email!, "password":event.password!});
      if(jsonResponse != null){
        Map<String, dynamic> data = jsonDecode(jsonResponse);
        print(data);
        emit(AuthSuccess(token:data['token'] ));
      }
      else{
        emit(AuthFailure(errorMessage: 'No Data Found'));
      }
    }
    else{
      emit(AuthFailure(errorMessage: "Something Went Wrong"));
    }
  }
}