import 'package:bloc_tutorial/helpers/pref_repository.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferenceRepository.initialise();
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory:  HydratedStorageDirectory((await getTemporaryDirectory()).path));
  runApp(const MyApp());
}

