import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'core/observers/bloc_observer.dart';
import 'dependency_injection/di.dart';

void main(){
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}
