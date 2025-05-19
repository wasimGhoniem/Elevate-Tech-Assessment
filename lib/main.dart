import 'package:bloc/bloc.dart';
import 'package:elevate_tech_assessment/features/ui/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/app_routes.dart';
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
    return ScreenUtilInit(
      designSize: Size(430,932),
      builder: (context,child)=>MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:AppRoutes.productRoute ,
        routes:{
          AppRoutes.productRoute:(context)=>ProductScreen(),
        } ,
        themeMode: ThemeMode.light,
      ),


    );
  }
}
