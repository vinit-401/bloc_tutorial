import 'package:bloc_tutorial/api/network_api.dart';
import 'package:bloc_tutorial/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    String email =  "eve.holt@reqres.in";
    String password = "cityslicka";
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthFailure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            builder: (context, state) {
              if(state is AuthLoading){
                return Center(child: CircularProgressIndicator(),);
              }
              else if(state is AuthFailure){
                return Center(child: Text(state.errorMessage),);
              }
             else if(state is AuthSuccess){
               return Center(
                 child: Column(
                   children: [
                     Text(email),
                     Text(password),
                     TextButton(
                       onPressed: () async {
                         context.read<AuthBloc>().add(AuthLoginEvent(email: email, password: password));
                       },
                       child: Text("Login"),
                     ),
                     Text('${state.token??""} '),
                   ],
                 ),
               );
             }
             return Container();
            },
          ),
        ],
      ),
    );
  }
}
